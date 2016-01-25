<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet version="1.0" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:ccts-cct="urn:un:unece:uncefact:data:specification:CoreComponentTypeSchemaModule:2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:p1="urn:oasis:names:specification:ubl:schema:xsd:Tender-2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDataTypes-2" xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:udt="urn:oasis:names:specification:ubl:schema:xsd:UnqualifiedDataTypes-2" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
    <svrl:schematron-output schemaVersion="iso" title="BII2 CORE restrictions for Tender Transaction (T44) UBL-Tender-2.1">
      <xsl:comment>
        <xsl:value-of select="$archiveDirParameter" />   
		 <xsl:value-of select="$archiveNameParameter" />  
		 <xsl:value-of select="$fileNameParameter" />  
		 <xsl:value-of select="$fileDirParameter" />
      </xsl:comment>
      <svrl:ns-prefix-in-attribute-values prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" />
      <svrl:ns-prefix-in-attribute-values prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" />
      <svrl:ns-prefix-in-attribute-values prefix="ext" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" />
      <svrl:ns-prefix-in-attribute-values prefix="qdt" uri="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDataTypes-2" />
      <svrl:ns-prefix-in-attribute-values prefix="p1" uri="urn:oasis:names:specification:ubl:schema:xsd:Tender-2" />
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
    </svrl:schematron-output>
  </xsl:template>

<!--SCHEMATRON PATTERNS-->
<svrl:text>BII2 CORE restrictions for Tender Transaction (T44) UBL-Tender-2.1</svrl:text>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:AgentParty" mode="M9" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:AgentParty" />

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
    <xsl:apply-templates mode="M9" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M9" priority="-1" />
  <xsl:template match="@*|node()" mode="M9" priority="-2">
    <xsl:apply-templates mode="M9" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:Contact/cac:OtherCommunication" mode="M10" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:Contact/cac:OtherCommunication" />

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
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M10" priority="-1" />
  <xsl:template match="@*|node()" mode="M10" priority="-2">
    <xsl:apply-templates mode="M10" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:Contact/cbc:ElectronicMail" mode="M11" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:Contact/cbc:ElectronicMail" />

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
    <xsl:apply-templates mode="M11" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M11" priority="-1" />
  <xsl:template match="@*|node()" mode="M11" priority="-2">
    <xsl:apply-templates mode="M11" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:Contact/cbc:ID" mode="M12" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:Contact/cbc:ID" />

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
    <xsl:apply-templates mode="M12" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M12" priority="-1" />
  <xsl:template match="@*|node()" mode="M12" priority="-2">
    <xsl:apply-templates mode="M12" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:Contact/cbc:Name" mode="M13" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:Contact/cbc:Name" />

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
    <xsl:apply-templates mode="M13" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M13" priority="-1" />
  <xsl:template match="@*|node()" mode="M13" priority="-2">
    <xsl:apply-templates mode="M13" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:Contact/cbc:Note" mode="M14" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:Contact/cbc:Note" />

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
    <xsl:apply-templates mode="M14" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M14" priority="-1" />
  <xsl:template match="@*|node()" mode="M14" priority="-2">
    <xsl:apply-templates mode="M14" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:Contact/cbc:Telefax" mode="M15" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:Contact/cbc:Telefax" />

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
    <xsl:apply-templates mode="M15" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M15" priority="-1" />
  <xsl:template match="@*|node()" mode="M15" priority="-2">
    <xsl:apply-templates mode="M15" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:Contact/cbc:Telephone" mode="M16" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:Contact/cbc:Telephone" />

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
    <xsl:apply-templates mode="M16" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M16" priority="-1" />
  <xsl:template match="@*|node()" mode="M16" priority="-2">
    <xsl:apply-templates mode="M16" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:FinancialAccount" mode="M17" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:FinancialAccount" />

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
    <xsl:apply-templates mode="M17" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M17" priority="-1" />
  <xsl:template match="@*|node()" mode="M17" priority="-2">
    <xsl:apply-templates mode="M17" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:Language" mode="M18" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:Language" />

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
    <xsl:apply-templates mode="M18" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M18" priority="-1" />
  <xsl:template match="@*|node()" mode="M18" priority="-2">
    <xsl:apply-templates mode="M18" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyIdentification/cbc:ID" mode="M19" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyIdentification/cbc:ID" />

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
    <xsl:apply-templates mode="M19" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M19" priority="-1" />
  <xsl:template match="@*|node()" mode="M19" priority="-2">
    <xsl:apply-templates mode="M19" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:CorporateRegistrationScheme" mode="M20" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:CorporateRegistrationScheme" />

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
    <xsl:apply-templates mode="M20" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M20" priority="-1" />
  <xsl:template match="@*|node()" mode="M20" priority="-2">
    <xsl:apply-templates mode="M20" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:HeadParty" mode="M21" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:HeadParty" />

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
    <xsl:apply-templates mode="M21" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M21" priority="-1" />
  <xsl:template match="@*|node()" mode="M21" priority="-2">
    <xsl:apply-templates mode="M21" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine" mode="M22" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine" />

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
    <xsl:apply-templates mode="M22" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M22" priority="-1" />
  <xsl:template match="@*|node()" mode="M22" priority="-2">
    <xsl:apply-templates mode="M22" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode" mode="M23" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode" />

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
    <xsl:apply-templates mode="M23" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M23" priority="-1" />
  <xsl:template match="@*|node()" mode="M23" priority="-2">
    <xsl:apply-templates mode="M23" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:Name" mode="M24" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:Name" />

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
    <xsl:apply-templates mode="M24" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M24" priority="-1" />
  <xsl:template match="@*|node()" mode="M24" priority="-2">
    <xsl:apply-templates mode="M24" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:LocationCoordinate" mode="M25" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:LocationCoordinate" />

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
    <xsl:apply-templates mode="M25" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M25" priority="-1" />
  <xsl:template match="@*|node()" mode="M25" priority="-2">
    <xsl:apply-templates mode="M25" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AdditionalStreetName" mode="M26" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AdditionalStreetName" />

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
    <xsl:apply-templates mode="M26" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M26" priority="-1" />
  <xsl:template match="@*|node()" mode="M26" priority="-2">
    <xsl:apply-templates mode="M26" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressFormatCode" mode="M27" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressFormatCode" />

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
    <xsl:apply-templates mode="M27" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M27" priority="-1" />
  <xsl:template match="@*|node()" mode="M27" priority="-2">
    <xsl:apply-templates mode="M27" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressTypeCode" mode="M28" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressTypeCode" />

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
    <xsl:apply-templates mode="M28" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M28" priority="-1" />
  <xsl:template match="@*|node()" mode="M28" priority="-2">
    <xsl:apply-templates mode="M28" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BlockName" mode="M29" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BlockName" />

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
    <xsl:apply-templates mode="M29" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M29" priority="-1" />
  <xsl:template match="@*|node()" mode="M29" priority="-2">
    <xsl:apply-templates mode="M29" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingName" mode="M30" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingName" />

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
    <xsl:apply-templates mode="M30" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M30" priority="-1" />
  <xsl:template match="@*|node()" mode="M30" priority="-2">
    <xsl:apply-templates mode="M30" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingNumber" mode="M31" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingNumber" />

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
    <xsl:apply-templates mode="M31" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M31" priority="-1" />
  <xsl:template match="@*|node()" mode="M31" priority="-2">
    <xsl:apply-templates mode="M31" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName" mode="M32" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:CityName' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CitySubdivisionName" mode="M33" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CitySubdivisionName" />

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
    <xsl:apply-templates mode="M33" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M33" priority="-1" />
  <xsl:template match="@*|node()" mode="M33" priority="-2">
    <xsl:apply-templates mode="M33" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity" mode="M34" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity" />

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
    <xsl:apply-templates mode="M34" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M34" priority="-1" />
  <xsl:template match="@*|node()" mode="M34" priority="-2">
    <xsl:apply-templates mode="M34" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentityCode" mode="M35" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentityCode" />

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
    <xsl:apply-templates mode="M35" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M35" priority="-1" />
  <xsl:template match="@*|node()" mode="M35" priority="-2">
    <xsl:apply-templates mode="M35" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Department" mode="M36" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Department" />

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
    <xsl:apply-templates mode="M36" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M36" priority="-1" />
  <xsl:template match="@*|node()" mode="M36" priority="-2">
    <xsl:apply-templates mode="M36" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District" mode="M37" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District" />

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
    <xsl:apply-templates mode="M37" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M37" priority="-1" />
  <xsl:template match="@*|node()" mode="M37" priority="-2">
    <xsl:apply-templates mode="M37" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Floor" mode="M38" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Floor" />

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
    <xsl:apply-templates mode="M38" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M38" priority="-1" />
  <xsl:template match="@*|node()" mode="M38" priority="-2">
    <xsl:apply-templates mode="M38" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:ID" mode="M39" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:ID" />

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
    <xsl:apply-templates mode="M39" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M39" priority="-1" />
  <xsl:template match="@*|node()" mode="M39" priority="-2">
    <xsl:apply-templates mode="M39" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:InhouseMail" mode="M40" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:InhouseMail" />

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
    <xsl:apply-templates mode="M40" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M40" priority="-1" />
  <xsl:template match="@*|node()" mode="M40" priority="-2">
    <xsl:apply-templates mode="M40" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkAttention" mode="M41" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkAttention" />

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
    <xsl:apply-templates mode="M41" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M41" priority="-1" />
  <xsl:template match="@*|node()" mode="M41" priority="-2">
    <xsl:apply-templates mode="M41" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkCare" mode="M42" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkCare" />

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
    <xsl:apply-templates mode="M42" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M42" priority="-1" />
  <xsl:template match="@*|node()" mode="M42" priority="-2">
    <xsl:apply-templates mode="M42" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PlotIdentification" mode="M43" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PlotIdentification" />

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
    <xsl:apply-templates mode="M43" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M43" priority="-1" />
  <xsl:template match="@*|node()" mode="M43" priority="-2">
    <xsl:apply-templates mode="M43" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PostalZone" mode="M44" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PostalZone" />

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
    <xsl:apply-templates mode="M44" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M44" priority="-1" />
  <xsl:template match="@*|node()" mode="M44" priority="-2">
    <xsl:apply-templates mode="M44" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Postbox" mode="M45" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Postbox" />

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
    <xsl:apply-templates mode="M45" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M45" priority="-1" />
  <xsl:template match="@*|node()" mode="M45" priority="-2">
    <xsl:apply-templates mode="M45" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Region" mode="M46" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Region" />

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
    <xsl:apply-templates mode="M46" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M46" priority="-1" />
  <xsl:template match="@*|node()" mode="M46" priority="-2">
    <xsl:apply-templates mode="M46" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Room" mode="M47" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Room" />

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
    <xsl:apply-templates mode="M47" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M47" priority="-1" />
  <xsl:template match="@*|node()" mode="M47" priority="-2">
    <xsl:apply-templates mode="M47" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:StreetName" mode="M48" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:StreetName" />

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
    <xsl:apply-templates mode="M48" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M48" priority="-1" />
  <xsl:template match="@*|node()" mode="M48" priority="-2">
    <xsl:apply-templates mode="M48" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:TimezoneOffset" mode="M49" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:TimezoneOffset" />

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
    <xsl:apply-templates mode="M49" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M49" priority="-1" />
  <xsl:template match="@*|node()" mode="M49" priority="-2">
    <xsl:apply-templates mode="M49" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:ShareholderParty" mode="M50" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cac:ShareholderParty" />

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
    <xsl:apply-templates mode="M50" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M50" priority="-1" />
  <xsl:template match="@*|node()" mode="M50" priority="-2">
    <xsl:apply-templates mode="M50" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID" mode="M51" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:CompanyID' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLegalFormCode" mode="M52" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLegalFormCode" />

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
    <xsl:apply-templates mode="M52" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M52" priority="-1" />
  <xsl:template match="@*|node()" mode="M52" priority="-2">
    <xsl:apply-templates mode="M52" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLiquidationStatusCode" mode="M53" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLiquidationStatusCode" />

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
    <xsl:apply-templates mode="M53" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M53" priority="-1" />
  <xsl:template match="@*|node()" mode="M53" priority="-2">
    <xsl:apply-templates mode="M53" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cbc:CorporateStockAmount" mode="M54" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cbc:CorporateStockAmount" />

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
    <xsl:apply-templates mode="M54" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M54" priority="-1" />
  <xsl:template match="@*|node()" mode="M54" priority="-2">
    <xsl:apply-templates mode="M54" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cbc:FullyPaidSharesIndicator" mode="M55" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cbc:FullyPaidSharesIndicator" />

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
    <xsl:apply-templates mode="M55" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M55" priority="-1" />
  <xsl:template match="@*|node()" mode="M55" priority="-2">
    <xsl:apply-templates mode="M55" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationDate" mode="M56" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationDate" />

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
    <xsl:apply-templates mode="M56" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M56" priority="-1" />
  <xsl:template match="@*|node()" mode="M56" priority="-2">
    <xsl:apply-templates mode="M56" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationExpirationDate" mode="M57" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationExpirationDate" />

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
    <xsl:apply-templates mode="M57" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M57" priority="-1" />
  <xsl:template match="@*|node()" mode="M57" priority="-2">
    <xsl:apply-templates mode="M57" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName" mode="M58" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName" />

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
    <xsl:apply-templates mode="M58" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M58" priority="-1" />
  <xsl:template match="@*|node()" mode="M58" priority="-2">
    <xsl:apply-templates mode="M58" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cbc:SoleProprietorshipIndicator" mode="M59" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyLegalEntity/cbc:SoleProprietorshipIndicator" />

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
    <xsl:apply-templates mode="M59" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M59" priority="-1" />
  <xsl:template match="@*|node()" mode="M59" priority="-2">
    <xsl:apply-templates mode="M59" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyName/cbc:Name" mode="M60" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyName/cbc:Name" />

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
    <xsl:apply-templates mode="M60" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M60" priority="-1" />
  <xsl:template match="@*|node()" mode="M60" priority="-2">
    <xsl:apply-templates mode="M60" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyTaxScheme" mode="M61" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PartyTaxScheme" />

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
    <xsl:apply-templates mode="M61" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M61" priority="-1" />
  <xsl:template match="@*|node()" mode="M61" priority="-2">
    <xsl:apply-templates mode="M61" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:Person" mode="M62" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:Person" />

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
    <xsl:apply-templates mode="M62" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M62" priority="-1" />
  <xsl:template match="@*|node()" mode="M62" priority="-2">
    <xsl:apply-templates mode="M62" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cac:AddressLine" mode="M63" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cac:AddressLine" />

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
    <xsl:apply-templates mode="M63" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M63" priority="-1" />
  <xsl:template match="@*|node()" mode="M63" priority="-2">
    <xsl:apply-templates mode="M63" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cac:Country/cbc:IdentificationCode" mode="M64" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cac:Country/cbc:IdentificationCode" />

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
    <xsl:apply-templates mode="M64" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M64" priority="-1" />
  <xsl:template match="@*|node()" mode="M64" priority="-2">
    <xsl:apply-templates mode="M64" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cac:Country/cbc:Name" mode="M65" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cac:Country/cbc:Name" />

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
    <xsl:apply-templates mode="M65" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M65" priority="-1" />
  <xsl:template match="@*|node()" mode="M65" priority="-2">
    <xsl:apply-templates mode="M65" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cac:LocationCoordinate" mode="M66" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cac:LocationCoordinate" />

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
    <xsl:apply-templates mode="M66" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M66" priority="-1" />
  <xsl:template match="@*|node()" mode="M66" priority="-2">
    <xsl:apply-templates mode="M66" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:AdditionalStreetName" mode="M67" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:AdditionalStreetName" />

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
    <xsl:apply-templates mode="M67" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M67" priority="-1" />
  <xsl:template match="@*|node()" mode="M67" priority="-2">
    <xsl:apply-templates mode="M67" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:AddressFormatCode" mode="M68" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:AddressFormatCode" />

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
    <xsl:apply-templates mode="M68" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M68" priority="-1" />
  <xsl:template match="@*|node()" mode="M68" priority="-2">
    <xsl:apply-templates mode="M68" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:AddressTypeCode" mode="M69" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:AddressTypeCode" />

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
    <xsl:apply-templates mode="M69" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M69" priority="-1" />
  <xsl:template match="@*|node()" mode="M69" priority="-2">
    <xsl:apply-templates mode="M69" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:BlockName" mode="M70" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:BlockName" />

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
    <xsl:apply-templates mode="M70" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M70" priority="-1" />
  <xsl:template match="@*|node()" mode="M70" priority="-2">
    <xsl:apply-templates mode="M70" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:BuildingName" mode="M71" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:BuildingName" />

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
    <xsl:apply-templates mode="M71" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M71" priority="-1" />
  <xsl:template match="@*|node()" mode="M71" priority="-2">
    <xsl:apply-templates mode="M71" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:BuildingNumber" mode="M72" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:BuildingNumber" />

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
    <xsl:apply-templates mode="M72" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M72" priority="-1" />
  <xsl:template match="@*|node()" mode="M72" priority="-2">
    <xsl:apply-templates mode="M72" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:CityName" mode="M73" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:CityName" />

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
    <xsl:apply-templates mode="M73" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M73" priority="-1" />
  <xsl:template match="@*|node()" mode="M73" priority="-2">
    <xsl:apply-templates mode="M73" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:CitySubdivisionName" mode="M74" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:CitySubdivisionName" />

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
    <xsl:apply-templates mode="M74" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M74" priority="-1" />
  <xsl:template match="@*|node()" mode="M74" priority="-2">
    <xsl:apply-templates mode="M74" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:CountrySubentity" mode="M75" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:CountrySubentity" />

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
    <xsl:apply-templates mode="M75" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M75" priority="-1" />
  <xsl:template match="@*|node()" mode="M75" priority="-2">
    <xsl:apply-templates mode="M75" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:CountrySubentityCode" mode="M76" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:CountrySubentityCode" />

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
    <xsl:apply-templates mode="M76" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M76" priority="-1" />
  <xsl:template match="@*|node()" mode="M76" priority="-2">
    <xsl:apply-templates mode="M76" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:Department" mode="M77" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:Department" />

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
    <xsl:apply-templates mode="M77" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M77" priority="-1" />
  <xsl:template match="@*|node()" mode="M77" priority="-2">
    <xsl:apply-templates mode="M77" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:District" mode="M78" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:District" />

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
    <xsl:apply-templates mode="M78" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M78" priority="-1" />
  <xsl:template match="@*|node()" mode="M78" priority="-2">
    <xsl:apply-templates mode="M78" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:Floor" mode="M79" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:Floor" />

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
    <xsl:apply-templates mode="M79" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M79" priority="-1" />
  <xsl:template match="@*|node()" mode="M79" priority="-2">
    <xsl:apply-templates mode="M79" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:ID" mode="M80" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:ID" />

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
    <xsl:apply-templates mode="M80" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M80" priority="-1" />
  <xsl:template match="@*|node()" mode="M80" priority="-2">
    <xsl:apply-templates mode="M80" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:InhouseMail" mode="M81" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:InhouseMail" />

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
    <xsl:apply-templates mode="M81" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M81" priority="-1" />
  <xsl:template match="@*|node()" mode="M81" priority="-2">
    <xsl:apply-templates mode="M81" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:MarkAttention" mode="M82" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:MarkAttention" />

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
    <xsl:apply-templates mode="M82" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M82" priority="-1" />
  <xsl:template match="@*|node()" mode="M82" priority="-2">
    <xsl:apply-templates mode="M82" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:MarkCare" mode="M83" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:MarkCare" />

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
    <xsl:apply-templates mode="M83" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M83" priority="-1" />
  <xsl:template match="@*|node()" mode="M83" priority="-2">
    <xsl:apply-templates mode="M83" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:PlotIdentification" mode="M84" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:PlotIdentification" />

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
    <xsl:apply-templates mode="M84" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M84" priority="-1" />
  <xsl:template match="@*|node()" mode="M84" priority="-2">
    <xsl:apply-templates mode="M84" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:PostalZone" mode="M85" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:PostalZone" />

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
    <xsl:apply-templates mode="M85" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M85" priority="-1" />
  <xsl:template match="@*|node()" mode="M85" priority="-2">
    <xsl:apply-templates mode="M85" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:Postbox" mode="M86" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:Postbox" />

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
    <xsl:apply-templates mode="M86" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M86" priority="-1" />
  <xsl:template match="@*|node()" mode="M86" priority="-2">
    <xsl:apply-templates mode="M86" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:Region" mode="M87" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:Region" />

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
    <xsl:apply-templates mode="M87" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M87" priority="-1" />
  <xsl:template match="@*|node()" mode="M87" priority="-2">
    <xsl:apply-templates mode="M87" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:Room" mode="M88" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:Room" />

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
    <xsl:apply-templates mode="M88" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M88" priority="-1" />
  <xsl:template match="@*|node()" mode="M88" priority="-2">
    <xsl:apply-templates mode="M88" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:StreetName" mode="M89" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:StreetName" />

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
    <xsl:apply-templates mode="M89" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M89" priority="-1" />
  <xsl:template match="@*|node()" mode="M89" priority="-2">
    <xsl:apply-templates mode="M89" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:TimezoneOffset" mode="M90" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:TimezoneOffset" />

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
    <xsl:apply-templates mode="M90" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M90" priority="-1" />
  <xsl:template match="@*|node()" mode="M90" priority="-2">
    <xsl:apply-templates mode="M90" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:LocationCoordinate" mode="M91" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:LocationCoordinate" />

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
    <xsl:apply-templates mode="M91" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M91" priority="-1" />
  <xsl:template match="@*|node()" mode="M91" priority="-2">
    <xsl:apply-templates mode="M91" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:SubsidiaryLocation" mode="M92" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:SubsidiaryLocation" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:SubsidiaryLocation' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:ValidityPeriod" mode="M93" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cac:ValidityPeriod" />

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
    <xsl:apply-templates mode="M93" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M93" priority="-1" />
  <xsl:template match="@*|node()" mode="M93" priority="-2">
    <xsl:apply-templates mode="M93" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cbc:Conditions" mode="M94" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cbc:Conditions" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:Conditions' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cbc:CountrySubentity" mode="M95" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cbc:CountrySubentity" />

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
    <xsl:apply-templates mode="M95" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M95" priority="-1" />
  <xsl:template match="@*|node()" mode="M95" priority="-2">
    <xsl:apply-templates mode="M95" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cbc:CountrySubentityCode" mode="M96" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cbc:CountrySubentityCode" />

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
    <xsl:apply-templates mode="M96" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M96" priority="-1" />
  <xsl:template match="@*|node()" mode="M96" priority="-2">
    <xsl:apply-templates mode="M96" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cbc:Description" mode="M97" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cbc:Description" />

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
    <xsl:apply-templates mode="M97" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M97" priority="-1" />
  <xsl:template match="@*|node()" mode="M97" priority="-2">
    <xsl:apply-templates mode="M97" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cbc:ID" mode="M98" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cbc:ID" />

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
    <xsl:apply-templates mode="M98" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M98" priority="-1" />
  <xsl:template match="@*|node()" mode="M98" priority="-2">
    <xsl:apply-templates mode="M98" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cbc:InformationURI" mode="M99" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cbc:InformationURI" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:InformationURI' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cbc:LocationTypeCode" mode="M100" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cbc:LocationTypeCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:LocationTypeCode' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cbc:Name" mode="M101" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PhysicalLocation/cbc:Name" />

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
    <xsl:apply-templates mode="M101" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M101" priority="-1" />
  <xsl:template match="@*|node()" mode="M101" priority="-2">
    <xsl:apply-templates mode="M101" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cac:AddressLine" mode="M102" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cac:AddressLine" />

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
    <xsl:apply-templates mode="M102" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M102" priority="-1" />
  <xsl:template match="@*|node()" mode="M102" priority="-2">
    <xsl:apply-templates mode="M102" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cac:Country" mode="M103" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cac:Country" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:Country' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cac:LocationCoordinate" mode="M104" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cac:LocationCoordinate" />

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
    <xsl:apply-templates mode="M104" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M104" priority="-1" />
  <xsl:template match="@*|node()" mode="M104" priority="-2">
    <xsl:apply-templates mode="M104" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName" mode="M105" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName" />

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
    <xsl:apply-templates mode="M105" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M105" priority="-1" />
  <xsl:template match="@*|node()" mode="M105" priority="-2">
    <xsl:apply-templates mode="M105" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:AddressFormatCode" mode="M106" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:AddressFormatCode" />

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
    <xsl:apply-templates mode="M106" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M106" priority="-1" />
  <xsl:template match="@*|node()" mode="M106" priority="-2">
    <xsl:apply-templates mode="M106" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:AddressTypeCode" mode="M107" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:AddressTypeCode" />

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
    <xsl:apply-templates mode="M107" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M107" priority="-1" />
  <xsl:template match="@*|node()" mode="M107" priority="-2">
    <xsl:apply-templates mode="M107" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:BlockName" mode="M108" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:BlockName" />

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
    <xsl:apply-templates mode="M108" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M108" priority="-1" />
  <xsl:template match="@*|node()" mode="M108" priority="-2">
    <xsl:apply-templates mode="M108" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:BuildingName" mode="M109" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:BuildingName" />

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
    <xsl:apply-templates mode="M109" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M109" priority="-1" />
  <xsl:template match="@*|node()" mode="M109" priority="-2">
    <xsl:apply-templates mode="M109" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:BuildingNumber" mode="M110" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:BuildingNumber" />

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
    <xsl:apply-templates mode="M110" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M110" priority="-1" />
  <xsl:template match="@*|node()" mode="M110" priority="-2">
    <xsl:apply-templates mode="M110" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:CityName" mode="M111" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:CityName" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:CityName' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:CitySubdivisionName" mode="M112" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:CitySubdivisionName" />

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
    <xsl:apply-templates mode="M112" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M112" priority="-1" />
  <xsl:template match="@*|node()" mode="M112" priority="-2">
    <xsl:apply-templates mode="M112" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity" mode="M113" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity" />

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
    <xsl:apply-templates mode="M113" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M113" priority="-1" />
  <xsl:template match="@*|node()" mode="M113" priority="-2">
    <xsl:apply-templates mode="M113" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:CountrySubentityCode" mode="M114" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:CountrySubentityCode" />

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
    <xsl:apply-templates mode="M114" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M114" priority="-1" />
  <xsl:template match="@*|node()" mode="M114" priority="-2">
    <xsl:apply-templates mode="M114" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:Department" mode="M115" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:Department" />

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
    <xsl:apply-templates mode="M115" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M115" priority="-1" />
  <xsl:template match="@*|node()" mode="M115" priority="-2">
    <xsl:apply-templates mode="M115" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:District" mode="M116" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:District" />

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
    <xsl:apply-templates mode="M116" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M116" priority="-1" />
  <xsl:template match="@*|node()" mode="M116" priority="-2">
    <xsl:apply-templates mode="M116" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:Floor" mode="M117" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:Floor" />

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
    <xsl:apply-templates mode="M117" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M117" priority="-1" />
  <xsl:template match="@*|node()" mode="M117" priority="-2">
    <xsl:apply-templates mode="M117" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:ID" mode="M118" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:ID" />

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
    <xsl:apply-templates mode="M118" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M118" priority="-1" />
  <xsl:template match="@*|node()" mode="M118" priority="-2">
    <xsl:apply-templates mode="M118" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:InhouseMail" mode="M119" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:InhouseMail" />

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
    <xsl:apply-templates mode="M119" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M119" priority="-1" />
  <xsl:template match="@*|node()" mode="M119" priority="-2">
    <xsl:apply-templates mode="M119" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:MarkAttention" mode="M120" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:MarkAttention" />

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
    <xsl:apply-templates mode="M120" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M120" priority="-1" />
  <xsl:template match="@*|node()" mode="M120" priority="-2">
    <xsl:apply-templates mode="M120" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:MarkCare" mode="M121" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:MarkCare" />

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
    <xsl:apply-templates mode="M121" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M121" priority="-1" />
  <xsl:template match="@*|node()" mode="M121" priority="-2">
    <xsl:apply-templates mode="M121" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:PlotIdentification" mode="M122" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:PlotIdentification" />

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
    <xsl:apply-templates mode="M122" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M122" priority="-1" />
  <xsl:template match="@*|node()" mode="M122" priority="-2">
    <xsl:apply-templates mode="M122" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:PostalZone" mode="M123" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:PostalZone" />

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
    <xsl:apply-templates mode="M123" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M123" priority="-1" />
  <xsl:template match="@*|node()" mode="M123" priority="-2">
    <xsl:apply-templates mode="M123" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:Postbox" mode="M124" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:Postbox" />

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
    <xsl:apply-templates mode="M124" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M124" priority="-1" />
  <xsl:template match="@*|node()" mode="M124" priority="-2">
    <xsl:apply-templates mode="M124" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:Region" mode="M125" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:Region" />

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
    <xsl:apply-templates mode="M125" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M125" priority="-1" />
  <xsl:template match="@*|node()" mode="M125" priority="-2">
    <xsl:apply-templates mode="M125" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:Room" mode="M126" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:Room" />

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
    <xsl:apply-templates mode="M126" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M126" priority="-1" />
  <xsl:template match="@*|node()" mode="M126" priority="-2">
    <xsl:apply-templates mode="M126" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:StreetName" mode="M127" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:StreetName" />

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
    <xsl:apply-templates mode="M127" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M127" priority="-1" />
  <xsl:template match="@*|node()" mode="M127" priority="-2">
    <xsl:apply-templates mode="M127" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:TimezoneOffset" mode="M128" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PostalAddress/cbc:TimezoneOffset" />

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
    <xsl:apply-templates mode="M128" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M128" priority="-1" />
  <xsl:template match="@*|node()" mode="M128" priority="-2">
    <xsl:apply-templates mode="M128" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:PowerOfAttorney" mode="M129" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:PowerOfAttorney" />

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
    <xsl:apply-templates mode="M129" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M129" priority="-1" />
  <xsl:template match="@*|node()" mode="M129" priority="-2">
    <xsl:apply-templates mode="M129" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cac:ServiceProviderParty" mode="M130" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cac:ServiceProviderParty" />

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
    <xsl:apply-templates mode="M130" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M130" priority="-1" />
  <xsl:template match="@*|node()" mode="M130" priority="-2">
    <xsl:apply-templates mode="M130" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cbc:EndpointID" mode="M131" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cbc:EndpointID" />

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
    <xsl:apply-templates mode="M131" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M131" priority="-1" />
  <xsl:template match="@*|node()" mode="M131" priority="-2">
    <xsl:apply-templates mode="M131" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cbc:IndustryClassificationCode" mode="M132" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cbc:IndustryClassificationCode" />

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
    <xsl:apply-templates mode="M132" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M132" priority="-1" />
  <xsl:template match="@*|node()" mode="M132" priority="-2">
    <xsl:apply-templates mode="M132" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cbc:LogoReferenceID" mode="M133" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cbc:LogoReferenceID" />

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
    <xsl:apply-templates mode="M133" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M133" priority="-1" />
  <xsl:template match="@*|node()" mode="M133" priority="-2">
    <xsl:apply-templates mode="M133" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cbc:MarkAttentionIndicator" mode="M134" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cbc:MarkAttentionIndicator" />

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
    <xsl:apply-templates mode="M134" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M134" priority="-1" />
  <xsl:template match="@*|node()" mode="M134" priority="-2">
    <xsl:apply-templates mode="M134" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cbc:MarkCareIndicator" mode="M135" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cbc:MarkCareIndicator" />

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
    <xsl:apply-templates mode="M135" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M135" priority="-1" />
  <xsl:template match="@*|node()" mode="M135" priority="-2">
    <xsl:apply-templates mode="M135" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cac:Party/cbc:WebsiteURI" mode="M136" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cac:Party/cbc:WebsiteURI" />

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
    <xsl:apply-templates mode="M136" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M136" priority="-1" />
  <xsl:template match="@*|node()" mode="M136" priority="-2">
    <xsl:apply-templates mode="M136" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ContractingParty/cbc:ActivityCode" mode="M137" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cbc:ActivityCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:ActivityCode' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:ContractingParty/cbc:BuyerProfileURI" mode="M138" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cbc:BuyerProfileURI" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:BuyerProfileURI' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:ContractingParty/cbc:ContractingPartyTypeCode" mode="M139" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ContractingParty/cbc:ContractingPartyTypeCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:ContractingPartyTypeCode' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:DocumentReference/cac:Attachment/cac:ExternalReference" mode="M140" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:DocumentReference/cac:Attachment/cac:ExternalReference" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:ExternalReference' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:DocumentReference/cac:IssuerParty" mode="M141" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:DocumentReference/cac:IssuerParty" />

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
    <xsl:apply-templates mode="M141" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M141" priority="-1" />
  <xsl:template match="@*|node()" mode="M141" priority="-2">
    <xsl:apply-templates mode="M141" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:DocumentReference/cac:ResultOfVerification" mode="M142" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:DocumentReference/cac:ResultOfVerification" />

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
    <xsl:apply-templates mode="M142" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M142" priority="-1" />
  <xsl:template match="@*|node()" mode="M142" priority="-2">
    <xsl:apply-templates mode="M142" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:DocumentReference/cac:ValidityPeriod" mode="M143" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:DocumentReference/cac:ValidityPeriod" />

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
    <xsl:apply-templates mode="M143" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M143" priority="-1" />
  <xsl:template match="@*|node()" mode="M143" priority="-2">
    <xsl:apply-templates mode="M143" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:DocumentReference/cbc:CopyIndicator" mode="M144" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:DocumentReference/cbc:CopyIndicator" />

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
    <xsl:apply-templates mode="M144" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M144" priority="-1" />
  <xsl:template match="@*|node()" mode="M144" priority="-2">
    <xsl:apply-templates mode="M144" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:DocumentReference/cbc:DocumentDescription" mode="M145" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:DocumentReference/cbc:DocumentDescription" />

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
    <xsl:apply-templates mode="M145" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M145" priority="-1" />
  <xsl:template match="@*|node()" mode="M145" priority="-2">
    <xsl:apply-templates mode="M145" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:DocumentReference/cbc:DocumentStatusCode" mode="M146" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:DocumentReference/cbc:DocumentStatusCode" />

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
    <xsl:apply-templates mode="M146" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M146" priority="-1" />
  <xsl:template match="@*|node()" mode="M146" priority="-2">
    <xsl:apply-templates mode="M146" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:DocumentReference/cbc:DocumentType" mode="M147" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:DocumentReference/cbc:DocumentType" />

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
    <xsl:apply-templates mode="M147" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M147" priority="-1" />
  <xsl:template match="@*|node()" mode="M147" priority="-2">
    <xsl:apply-templates mode="M147" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:DocumentReference/cbc:DocumentTypeCode" mode="M148" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:DocumentReference/cbc:DocumentTypeCode" />

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
    <xsl:apply-templates mode="M148" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M148" priority="-1" />
  <xsl:template match="@*|node()" mode="M148" priority="-2">
    <xsl:apply-templates mode="M148" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:DocumentReference/cbc:ID" mode="M149" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:DocumentReference/cbc:ID" />

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
    <xsl:apply-templates mode="M149" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M149" priority="-1" />
  <xsl:template match="@*|node()" mode="M149" priority="-2">
    <xsl:apply-templates mode="M149" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:DocumentReference/cbc:IssueDate" mode="M150" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:DocumentReference/cbc:IssueDate" />

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
    <xsl:apply-templates mode="M150" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M150" priority="-1" />
  <xsl:template match="@*|node()" mode="M150" priority="-2">
    <xsl:apply-templates mode="M150" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:DocumentReference/cbc:IssueTime" mode="M151" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:DocumentReference/cbc:IssueTime" />

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
    <xsl:apply-templates mode="M151" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M151" priority="-1" />
  <xsl:template match="@*|node()" mode="M151" priority="-2">
    <xsl:apply-templates mode="M151" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:DocumentReference/cbc:LanguageID" mode="M152" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:DocumentReference/cbc:LanguageID" />

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
    <xsl:apply-templates mode="M152" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M152" priority="-1" />
  <xsl:template match="@*|node()" mode="M152" priority="-2">
    <xsl:apply-templates mode="M152" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:DocumentReference/cbc:LocaleCode" mode="M153" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:DocumentReference/cbc:LocaleCode" />

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
    <xsl:apply-templates mode="M153" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M153" priority="-1" />
  <xsl:template match="@*|node()" mode="M153" priority="-2">
    <xsl:apply-templates mode="M153" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:DocumentReference/cbc:UUID" mode="M154" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:DocumentReference/cbc:UUID" />

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
    <xsl:apply-templates mode="M154" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M154" priority="-1" />
  <xsl:template match="@*|node()" mode="M154" priority="-2">
    <xsl:apply-templates mode="M154" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:DocumentReference/cbc:VersionID" mode="M155" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:DocumentReference/cbc:VersionID" />

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
    <xsl:apply-templates mode="M155" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M155" priority="-1" />
  <xsl:template match="@*|node()" mode="M155" priority="-2">
    <xsl:apply-templates mode="M155" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:DocumentReference/cbc:XPath" mode="M156" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:DocumentReference/cbc:XPath" />

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
    <xsl:apply-templates mode="M156" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M156" priority="-1" />
  <xsl:template match="@*|node()" mode="M156" priority="-2">
    <xsl:apply-templates mode="M156" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:AccountingContact" mode="M157" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:AccountingContact" />

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
    <xsl:apply-templates mode="M157" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M157" priority="-1" />
  <xsl:template match="@*|node()" mode="M157" priority="-2">
    <xsl:apply-templates mode="M157" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:BuyerContact" mode="M158" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:BuyerContact" />

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
    <xsl:apply-templates mode="M158" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M158" priority="-1" />
  <xsl:template match="@*|node()" mode="M158" priority="-2">
    <xsl:apply-templates mode="M158" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:DeliveryContact" mode="M159" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:DeliveryContact" />

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
    <xsl:apply-templates mode="M159" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M159" priority="-1" />
  <xsl:template match="@*|node()" mode="M159" priority="-2">
    <xsl:apply-templates mode="M159" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:AgentParty" mode="M160" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:AgentParty" />

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
    <xsl:apply-templates mode="M160" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M160" priority="-1" />
  <xsl:template match="@*|node()" mode="M160" priority="-2">
    <xsl:apply-templates mode="M160" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:Contact/cac:OtherCommunication" mode="M161" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:Contact/cac:OtherCommunication" />

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
    <xsl:apply-templates mode="M161" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M161" priority="-1" />
  <xsl:template match="@*|node()" mode="M161" priority="-2">
    <xsl:apply-templates mode="M161" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:Contact/cbc:ElectronicMail" mode="M162" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:Contact/cbc:ElectronicMail" />

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
    <xsl:apply-templates mode="M162" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M162" priority="-1" />
  <xsl:template match="@*|node()" mode="M162" priority="-2">
    <xsl:apply-templates mode="M162" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:Contact/cbc:ID" mode="M163" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:Contact/cbc:ID" />

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
    <xsl:apply-templates mode="M163" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M163" priority="-1" />
  <xsl:template match="@*|node()" mode="M163" priority="-2">
    <xsl:apply-templates mode="M163" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:Contact/cbc:Name" mode="M164" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:Contact/cbc:Name" />

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
    <xsl:apply-templates mode="M164" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M164" priority="-1" />
  <xsl:template match="@*|node()" mode="M164" priority="-2">
    <xsl:apply-templates mode="M164" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:Contact/cbc:Note" mode="M165" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:Contact/cbc:Note" />

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
    <xsl:apply-templates mode="M165" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M165" priority="-1" />
  <xsl:template match="@*|node()" mode="M165" priority="-2">
    <xsl:apply-templates mode="M165" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:Contact/cbc:Telefax" mode="M166" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:Contact/cbc:Telefax" />

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
    <xsl:apply-templates mode="M166" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M166" priority="-1" />
  <xsl:template match="@*|node()" mode="M166" priority="-2">
    <xsl:apply-templates mode="M166" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:Contact/cbc:Telephone" mode="M167" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:Contact/cbc:Telephone" />

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
    <xsl:apply-templates mode="M167" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M167" priority="-1" />
  <xsl:template match="@*|node()" mode="M167" priority="-2">
    <xsl:apply-templates mode="M167" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:FinancialAccount" mode="M168" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:FinancialAccount" />

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
    <xsl:apply-templates mode="M168" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M168" priority="-1" />
  <xsl:template match="@*|node()" mode="M168" priority="-2">
    <xsl:apply-templates mode="M168" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:Language" mode="M169" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:Language" />

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
    <xsl:apply-templates mode="M169" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M169" priority="-1" />
  <xsl:template match="@*|node()" mode="M169" priority="-2">
    <xsl:apply-templates mode="M169" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID" mode="M170" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID" />

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
    <xsl:apply-templates mode="M170" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M170" priority="-1" />
  <xsl:template match="@*|node()" mode="M170" priority="-2">
    <xsl:apply-templates mode="M170" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:CorporateRegistrationScheme" mode="M171" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:CorporateRegistrationScheme" />

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
    <xsl:apply-templates mode="M171" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M171" priority="-1" />
  <xsl:template match="@*|node()" mode="M171" priority="-2">
    <xsl:apply-templates mode="M171" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:HeadParty" mode="M172" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:HeadParty" />

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
    <xsl:apply-templates mode="M172" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M172" priority="-1" />
  <xsl:template match="@*|node()" mode="M172" priority="-2">
    <xsl:apply-templates mode="M172" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine" mode="M173" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine" />

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
    <xsl:apply-templates mode="M173" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M173" priority="-1" />
  <xsl:template match="@*|node()" mode="M173" priority="-2">
    <xsl:apply-templates mode="M173" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode" mode="M174" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode" />

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
    <xsl:apply-templates mode="M174" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M174" priority="-1" />
  <xsl:template match="@*|node()" mode="M174" priority="-2">
    <xsl:apply-templates mode="M174" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:Name" mode="M175" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:Name" />

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
    <xsl:apply-templates mode="M175" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M175" priority="-1" />
  <xsl:template match="@*|node()" mode="M175" priority="-2">
    <xsl:apply-templates mode="M175" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:LocationCoordinate" mode="M176" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:LocationCoordinate" />

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
    <xsl:apply-templates mode="M176" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M176" priority="-1" />
  <xsl:template match="@*|node()" mode="M176" priority="-2">
    <xsl:apply-templates mode="M176" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AdditionalStreetName" mode="M177" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AdditionalStreetName" />

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
    <xsl:apply-templates mode="M177" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M177" priority="-1" />
  <xsl:template match="@*|node()" mode="M177" priority="-2">
    <xsl:apply-templates mode="M177" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressFormatCode" mode="M178" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressFormatCode" />

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
    <xsl:apply-templates mode="M178" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M178" priority="-1" />
  <xsl:template match="@*|node()" mode="M178" priority="-2">
    <xsl:apply-templates mode="M178" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressTypeCode" mode="M179" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressTypeCode" />

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
    <xsl:apply-templates mode="M179" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M179" priority="-1" />
  <xsl:template match="@*|node()" mode="M179" priority="-2">
    <xsl:apply-templates mode="M179" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BlockName" mode="M180" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BlockName" />

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
    <xsl:apply-templates mode="M180" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M180" priority="-1" />
  <xsl:template match="@*|node()" mode="M180" priority="-2">
    <xsl:apply-templates mode="M180" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingName" mode="M181" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingName" />

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
    <xsl:apply-templates mode="M181" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M181" priority="-1" />
  <xsl:template match="@*|node()" mode="M181" priority="-2">
    <xsl:apply-templates mode="M181" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingNumber" mode="M182" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingNumber" />

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
    <xsl:apply-templates mode="M182" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M182" priority="-1" />
  <xsl:template match="@*|node()" mode="M182" priority="-2">
    <xsl:apply-templates mode="M182" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName" mode="M183" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:CityName' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CitySubdivisionName" mode="M184" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CitySubdivisionName" />

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
    <xsl:apply-templates mode="M184" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M184" priority="-1" />
  <xsl:template match="@*|node()" mode="M184" priority="-2">
    <xsl:apply-templates mode="M184" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity" mode="M185" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity" />

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
    <xsl:apply-templates mode="M185" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M185" priority="-1" />
  <xsl:template match="@*|node()" mode="M185" priority="-2">
    <xsl:apply-templates mode="M185" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentityCode" mode="M186" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentityCode" />

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
    <xsl:apply-templates mode="M186" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M186" priority="-1" />
  <xsl:template match="@*|node()" mode="M186" priority="-2">
    <xsl:apply-templates mode="M186" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Department" mode="M187" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Department" />

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
    <xsl:apply-templates mode="M187" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M187" priority="-1" />
  <xsl:template match="@*|node()" mode="M187" priority="-2">
    <xsl:apply-templates mode="M187" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District" mode="M188" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District" />

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
    <xsl:apply-templates mode="M188" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M188" priority="-1" />
  <xsl:template match="@*|node()" mode="M188" priority="-2">
    <xsl:apply-templates mode="M188" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Floor" mode="M189" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Floor" />

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
    <xsl:apply-templates mode="M189" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M189" priority="-1" />
  <xsl:template match="@*|node()" mode="M189" priority="-2">
    <xsl:apply-templates mode="M189" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:ID" mode="M190" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:ID" />

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
    <xsl:apply-templates mode="M190" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M190" priority="-1" />
  <xsl:template match="@*|node()" mode="M190" priority="-2">
    <xsl:apply-templates mode="M190" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:InhouseMail" mode="M191" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:InhouseMail" />

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
    <xsl:apply-templates mode="M191" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M191" priority="-1" />
  <xsl:template match="@*|node()" mode="M191" priority="-2">
    <xsl:apply-templates mode="M191" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkAttention" mode="M192" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkAttention" />

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
    <xsl:apply-templates mode="M192" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M192" priority="-1" />
  <xsl:template match="@*|node()" mode="M192" priority="-2">
    <xsl:apply-templates mode="M192" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkCare" mode="M193" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkCare" />

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
    <xsl:apply-templates mode="M193" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M193" priority="-1" />
  <xsl:template match="@*|node()" mode="M193" priority="-2">
    <xsl:apply-templates mode="M193" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PlotIdentification" mode="M194" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PlotIdentification" />

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
    <xsl:apply-templates mode="M194" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M194" priority="-1" />
  <xsl:template match="@*|node()" mode="M194" priority="-2">
    <xsl:apply-templates mode="M194" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PostalZone" mode="M195" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PostalZone" />

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
    <xsl:apply-templates mode="M195" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M195" priority="-1" />
  <xsl:template match="@*|node()" mode="M195" priority="-2">
    <xsl:apply-templates mode="M195" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Postbox" mode="M196" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Postbox" />

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
    <xsl:apply-templates mode="M196" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M196" priority="-1" />
  <xsl:template match="@*|node()" mode="M196" priority="-2">
    <xsl:apply-templates mode="M196" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Region" mode="M197" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Region" />

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
    <xsl:apply-templates mode="M197" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M197" priority="-1" />
  <xsl:template match="@*|node()" mode="M197" priority="-2">
    <xsl:apply-templates mode="M197" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Room" mode="M198" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Room" />

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
    <xsl:apply-templates mode="M198" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M198" priority="-1" />
  <xsl:template match="@*|node()" mode="M198" priority="-2">
    <xsl:apply-templates mode="M198" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:StreetName" mode="M199" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:StreetName" />

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
    <xsl:apply-templates mode="M199" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M199" priority="-1" />
  <xsl:template match="@*|node()" mode="M199" priority="-2">
    <xsl:apply-templates mode="M199" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:TimezoneOffset" mode="M200" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:TimezoneOffset" />

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
    <xsl:apply-templates mode="M200" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M200" priority="-1" />
  <xsl:template match="@*|node()" mode="M200" priority="-2">
    <xsl:apply-templates mode="M200" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:ShareholderParty" mode="M201" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cac:ShareholderParty" />

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
    <xsl:apply-templates mode="M201" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M201" priority="-1" />
  <xsl:template match="@*|node()" mode="M201" priority="-2">
    <xsl:apply-templates mode="M201" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID" mode="M202" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:CompanyID' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLegalFormCode" mode="M203" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLegalFormCode" />

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
    <xsl:apply-templates mode="M203" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M203" priority="-1" />
  <xsl:template match="@*|node()" mode="M203" priority="-2">
    <xsl:apply-templates mode="M203" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLiquidationStatusCode" mode="M204" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyLiquidationStatusCode" />

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
    <xsl:apply-templates mode="M204" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M204" priority="-1" />
  <xsl:template match="@*|node()" mode="M204" priority="-2">
    <xsl:apply-templates mode="M204" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CorporateStockAmount" mode="M205" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CorporateStockAmount" />

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
    <xsl:apply-templates mode="M205" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M205" priority="-1" />
  <xsl:template match="@*|node()" mode="M205" priority="-2">
    <xsl:apply-templates mode="M205" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:FullyPaidSharesIndicator" mode="M206" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:FullyPaidSharesIndicator" />

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
    <xsl:apply-templates mode="M206" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M206" priority="-1" />
  <xsl:template match="@*|node()" mode="M206" priority="-2">
    <xsl:apply-templates mode="M206" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationDate" mode="M207" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationDate" />

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
    <xsl:apply-templates mode="M207" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M207" priority="-1" />
  <xsl:template match="@*|node()" mode="M207" priority="-2">
    <xsl:apply-templates mode="M207" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationExpirationDate" mode="M208" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationExpirationDate" />

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
    <xsl:apply-templates mode="M208" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M208" priority="-1" />
  <xsl:template match="@*|node()" mode="M208" priority="-2">
    <xsl:apply-templates mode="M208" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName" mode="M209" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName" />

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
    <xsl:apply-templates mode="M209" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M209" priority="-1" />
  <xsl:template match="@*|node()" mode="M209" priority="-2">
    <xsl:apply-templates mode="M209" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:SoleProprietorshipIndicator" mode="M210" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:SoleProprietorshipIndicator" />

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
    <xsl:apply-templates mode="M210" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M210" priority="-1" />
  <xsl:template match="@*|node()" mode="M210" priority="-2">
    <xsl:apply-templates mode="M210" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyName/cbc:Name" mode="M211" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyName/cbc:Name" />

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
    <xsl:apply-templates mode="M211" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M211" priority="-1" />
  <xsl:template match="@*|node()" mode="M211" priority="-2">
    <xsl:apply-templates mode="M211" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyTaxScheme" mode="M212" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PartyTaxScheme" />

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
    <xsl:apply-templates mode="M212" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M212" priority="-1" />
  <xsl:template match="@*|node()" mode="M212" priority="-2">
    <xsl:apply-templates mode="M212" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:Person" mode="M213" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:Person" />

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
    <xsl:apply-templates mode="M213" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M213" priority="-1" />
  <xsl:template match="@*|node()" mode="M213" priority="-2">
    <xsl:apply-templates mode="M213" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cac:AddressLine" mode="M214" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cac:AddressLine" />

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
    <xsl:apply-templates mode="M214" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M214" priority="-1" />
  <xsl:template match="@*|node()" mode="M214" priority="-2">
    <xsl:apply-templates mode="M214" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cac:Country/cbc:IdentificationCode" mode="M215" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cac:Country/cbc:IdentificationCode" />

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
    <xsl:apply-templates mode="M215" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M215" priority="-1" />
  <xsl:template match="@*|node()" mode="M215" priority="-2">
    <xsl:apply-templates mode="M215" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cac:Country/cbc:Name" mode="M216" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cac:Country/cbc:Name" />

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
    <xsl:apply-templates mode="M216" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M216" priority="-1" />
  <xsl:template match="@*|node()" mode="M216" priority="-2">
    <xsl:apply-templates mode="M216" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cac:LocationCoordinate" mode="M217" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cac:LocationCoordinate" />

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
    <xsl:apply-templates mode="M217" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M217" priority="-1" />
  <xsl:template match="@*|node()" mode="M217" priority="-2">
    <xsl:apply-templates mode="M217" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:AdditionalStreetName" mode="M218" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:AdditionalStreetName" />

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
    <xsl:apply-templates mode="M218" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M218" priority="-1" />
  <xsl:template match="@*|node()" mode="M218" priority="-2">
    <xsl:apply-templates mode="M218" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:AddressFormatCode" mode="M219" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:AddressFormatCode" />

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
    <xsl:apply-templates mode="M219" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M219" priority="-1" />
  <xsl:template match="@*|node()" mode="M219" priority="-2">
    <xsl:apply-templates mode="M219" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:AddressTypeCode" mode="M220" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:AddressTypeCode" />

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
    <xsl:apply-templates mode="M220" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M220" priority="-1" />
  <xsl:template match="@*|node()" mode="M220" priority="-2">
    <xsl:apply-templates mode="M220" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:BlockName" mode="M221" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:BlockName" />

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
    <xsl:apply-templates mode="M221" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M221" priority="-1" />
  <xsl:template match="@*|node()" mode="M221" priority="-2">
    <xsl:apply-templates mode="M221" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:BuildingName" mode="M222" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:BuildingName" />

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
    <xsl:apply-templates mode="M222" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M222" priority="-1" />
  <xsl:template match="@*|node()" mode="M222" priority="-2">
    <xsl:apply-templates mode="M222" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:BuildingNumber" mode="M223" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:BuildingNumber" />

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
    <xsl:apply-templates mode="M223" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M223" priority="-1" />
  <xsl:template match="@*|node()" mode="M223" priority="-2">
    <xsl:apply-templates mode="M223" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:CityName" mode="M224" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:CityName" />

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
    <xsl:apply-templates mode="M224" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M224" priority="-1" />
  <xsl:template match="@*|node()" mode="M224" priority="-2">
    <xsl:apply-templates mode="M224" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:CitySubdivisionName" mode="M225" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:CitySubdivisionName" />

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
    <xsl:apply-templates mode="M225" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M225" priority="-1" />
  <xsl:template match="@*|node()" mode="M225" priority="-2">
    <xsl:apply-templates mode="M225" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:CountrySubentity" mode="M226" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:CountrySubentity" />

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
    <xsl:apply-templates mode="M226" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M226" priority="-1" />
  <xsl:template match="@*|node()" mode="M226" priority="-2">
    <xsl:apply-templates mode="M226" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:CountrySubentityCode" mode="M227" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:CountrySubentityCode" />

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
    <xsl:apply-templates mode="M227" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M227" priority="-1" />
  <xsl:template match="@*|node()" mode="M227" priority="-2">
    <xsl:apply-templates mode="M227" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:Department" mode="M228" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:Department" />

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
    <xsl:apply-templates mode="M228" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M228" priority="-1" />
  <xsl:template match="@*|node()" mode="M228" priority="-2">
    <xsl:apply-templates mode="M228" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:District" mode="M229" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:District" />

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
    <xsl:apply-templates mode="M229" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M229" priority="-1" />
  <xsl:template match="@*|node()" mode="M229" priority="-2">
    <xsl:apply-templates mode="M229" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:Floor" mode="M230" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:Floor" />

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
    <xsl:apply-templates mode="M230" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M230" priority="-1" />
  <xsl:template match="@*|node()" mode="M230" priority="-2">
    <xsl:apply-templates mode="M230" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:ID" mode="M231" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:ID" />

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
    <xsl:apply-templates mode="M231" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M231" priority="-1" />
  <xsl:template match="@*|node()" mode="M231" priority="-2">
    <xsl:apply-templates mode="M231" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:InhouseMail" mode="M232" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:InhouseMail" />

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
    <xsl:apply-templates mode="M232" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M232" priority="-1" />
  <xsl:template match="@*|node()" mode="M232" priority="-2">
    <xsl:apply-templates mode="M232" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:MarkAttention" mode="M233" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:MarkAttention" />

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
    <xsl:apply-templates mode="M233" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M233" priority="-1" />
  <xsl:template match="@*|node()" mode="M233" priority="-2">
    <xsl:apply-templates mode="M233" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:MarkCare" mode="M234" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:MarkCare" />

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
    <xsl:apply-templates mode="M234" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M234" priority="-1" />
  <xsl:template match="@*|node()" mode="M234" priority="-2">
    <xsl:apply-templates mode="M234" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:PlotIdentification" mode="M235" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:PlotIdentification" />

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
    <xsl:apply-templates mode="M235" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M235" priority="-1" />
  <xsl:template match="@*|node()" mode="M235" priority="-2">
    <xsl:apply-templates mode="M235" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:PostalZone" mode="M236" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:PostalZone" />

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
    <xsl:apply-templates mode="M236" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M236" priority="-1" />
  <xsl:template match="@*|node()" mode="M236" priority="-2">
    <xsl:apply-templates mode="M236" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:Postbox" mode="M237" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:Postbox" />

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
    <xsl:apply-templates mode="M237" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M237" priority="-1" />
  <xsl:template match="@*|node()" mode="M237" priority="-2">
    <xsl:apply-templates mode="M237" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:Region" mode="M238" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:Region" />

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
    <xsl:apply-templates mode="M238" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M238" priority="-1" />
  <xsl:template match="@*|node()" mode="M238" priority="-2">
    <xsl:apply-templates mode="M238" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:Room" mode="M239" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:Room" />

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
    <xsl:apply-templates mode="M239" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M239" priority="-1" />
  <xsl:template match="@*|node()" mode="M239" priority="-2">
    <xsl:apply-templates mode="M239" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:StreetName" mode="M240" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:StreetName" />

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
    <xsl:apply-templates mode="M240" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M240" priority="-1" />
  <xsl:template match="@*|node()" mode="M240" priority="-2">
    <xsl:apply-templates mode="M240" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:TimezoneOffset" mode="M241" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:Address/cbc:TimezoneOffset" />

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
    <xsl:apply-templates mode="M241" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M241" priority="-1" />
  <xsl:template match="@*|node()" mode="M241" priority="-2">
    <xsl:apply-templates mode="M241" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:LocationCoordinate" mode="M242" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:LocationCoordinate" />

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
    <xsl:apply-templates mode="M242" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M242" priority="-1" />
  <xsl:template match="@*|node()" mode="M242" priority="-2">
    <xsl:apply-templates mode="M242" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:SubsidiaryLocation" mode="M243" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:SubsidiaryLocation" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:SubsidiaryLocation' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:ValidityPeriod" mode="M244" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cac:ValidityPeriod" />

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
    <xsl:apply-templates mode="M244" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M244" priority="-1" />
  <xsl:template match="@*|node()" mode="M244" priority="-2">
    <xsl:apply-templates mode="M244" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Conditions" mode="M245" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Conditions" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:Conditions' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cbc:CountrySubentity" mode="M246" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cbc:CountrySubentity" />

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
    <xsl:apply-templates mode="M246" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M246" priority="-1" />
  <xsl:template match="@*|node()" mode="M246" priority="-2">
    <xsl:apply-templates mode="M246" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cbc:CountrySubentityCode" mode="M247" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cbc:CountrySubentityCode" />

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
    <xsl:apply-templates mode="M247" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M247" priority="-1" />
  <xsl:template match="@*|node()" mode="M247" priority="-2">
    <xsl:apply-templates mode="M247" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description" mode="M248" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Description" />

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
    <xsl:apply-templates mode="M248" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M248" priority="-1" />
  <xsl:template match="@*|node()" mode="M248" priority="-2">
    <xsl:apply-templates mode="M248" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cbc:ID" mode="M249" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cbc:ID" />

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
    <xsl:apply-templates mode="M249" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M249" priority="-1" />
  <xsl:template match="@*|node()" mode="M249" priority="-2">
    <xsl:apply-templates mode="M249" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cbc:InformationURI" mode="M250" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cbc:InformationURI" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:InformationURI' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cbc:LocationTypeCode" mode="M251" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cbc:LocationTypeCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:LocationTypeCode' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Name" mode="M252" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation/cbc:Name" />

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
    <xsl:apply-templates mode="M252" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M252" priority="-1" />
  <xsl:template match="@*|node()" mode="M252" priority="-2">
    <xsl:apply-templates mode="M252" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PostalAddress" mode="M253" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PostalAddress" />

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
    <xsl:apply-templates mode="M253" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M253" priority="-1" />
  <xsl:template match="@*|node()" mode="M253" priority="-2">
    <xsl:apply-templates mode="M253" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PowerOfAttorney" mode="M254" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:PowerOfAttorney" />

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
    <xsl:apply-templates mode="M254" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M254" priority="-1" />
  <xsl:template match="@*|node()" mode="M254" priority="-2">
    <xsl:apply-templates mode="M254" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:ServiceProviderParty" mode="M255" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cac:ServiceProviderParty" />

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
    <xsl:apply-templates mode="M255" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M255" priority="-1" />
  <xsl:template match="@*|node()" mode="M255" priority="-2">
    <xsl:apply-templates mode="M255" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cbc:EndpointID" mode="M256" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cbc:EndpointID" />

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
    <xsl:apply-templates mode="M256" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M256" priority="-1" />
  <xsl:template match="@*|node()" mode="M256" priority="-2">
    <xsl:apply-templates mode="M256" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cbc:IndustryClassificationCode" mode="M257" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cbc:IndustryClassificationCode" />

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
    <xsl:apply-templates mode="M257" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M257" priority="-1" />
  <xsl:template match="@*|node()" mode="M257" priority="-2">
    <xsl:apply-templates mode="M257" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cbc:LogoReferenceID" mode="M258" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cbc:LogoReferenceID" />

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
    <xsl:apply-templates mode="M258" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M258" priority="-1" />
  <xsl:template match="@*|node()" mode="M258" priority="-2">
    <xsl:apply-templates mode="M258" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cbc:MarkAttentionIndicator" mode="M259" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cbc:MarkAttentionIndicator" />

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
    <xsl:apply-templates mode="M259" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M259" priority="-1" />
  <xsl:template match="@*|node()" mode="M259" priority="-2">
    <xsl:apply-templates mode="M259" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cbc:MarkCareIndicator" mode="M260" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cbc:MarkCareIndicator" />

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
    <xsl:apply-templates mode="M260" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M260" priority="-1" />
  <xsl:template match="@*|node()" mode="M260" priority="-2">
    <xsl:apply-templates mode="M260" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cbc:WebsiteURI" mode="M261" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cac:Party/cbc:WebsiteURI" />

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
    <xsl:apply-templates mode="M261" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M261" priority="-1" />
  <xsl:template match="@*|node()" mode="M261" priority="-2">
    <xsl:apply-templates mode="M261" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cbc:AdditionalAccountID" mode="M262" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cbc:AdditionalAccountID" />

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
    <xsl:apply-templates mode="M262" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M262" priority="-1" />
  <xsl:template match="@*|node()" mode="M262" priority="-2">
    <xsl:apply-templates mode="M262" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cbc:CustomerAssignedAccountID" mode="M263" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cbc:CustomerAssignedAccountID" />

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
    <xsl:apply-templates mode="M263" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M263" priority="-1" />
  <xsl:template match="@*|node()" mode="M263" priority="-2">
    <xsl:apply-templates mode="M263" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:OriginatorCustomerParty/cbc:SupplierAssignedAccountID" mode="M264" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:OriginatorCustomerParty/cbc:SupplierAssignedAccountID" />

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
    <xsl:apply-templates mode="M264" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M264" priority="-1" />
  <xsl:template match="@*|node()" mode="M264" priority="-2">
    <xsl:apply-templates mode="M264" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:Signature/cac:DigitalSignatureAttachment" mode="M265" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:Signature/cac:DigitalSignatureAttachment" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:DigitalSignatureAttachment' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:Signature/cac:OriginalDocumentReference" mode="M266" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:Signature/cac:OriginalDocumentReference" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:OriginalDocumentReference' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:Signature/cac:SignatoryParty" mode="M267" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:Signature/cac:SignatoryParty" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:SignatoryParty' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:Signature/cbc:CanonicalizationMethod" mode="M268" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:Signature/cbc:CanonicalizationMethod" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:CanonicalizationMethod' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:Signature/cbc:ID" mode="M269" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:Signature/cbc:ID" />

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
    <xsl:apply-templates mode="M269" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M269" priority="-1" />
  <xsl:template match="@*|node()" mode="M269" priority="-2">
    <xsl:apply-templates mode="M269" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:Signature/cbc:Note" mode="M270" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:Signature/cbc:Note" />

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
    <xsl:apply-templates mode="M270" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M270" priority="-1" />
  <xsl:template match="@*|node()" mode="M270" priority="-2">
    <xsl:apply-templates mode="M270" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:Signature/cbc:SignatureMethod" mode="M271" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:Signature/cbc:SignatureMethod" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:SignatureMethod' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:Signature/cbc:ValidationDate" mode="M272" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:Signature/cbc:ValidationDate" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:ValidationDate' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:Signature/cbc:ValidationTime" mode="M273" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:Signature/cbc:ValidationTime" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:ValidationTime' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:Signature/cbc:ValidatorID" mode="M274" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:Signature/cbc:ValidatorID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:ValidatorID' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:SubcontractorParty" mode="M275" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:SubcontractorParty" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:SubcontractorParty' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:AwardingCriteriaResponse/cac:SubordinateAwardingCriteriaResponse" mode="M276" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:AwardingCriteriaResponse/cac:SubordinateAwardingCriteriaResponse" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:SubordinateAwardingCriteriaResponse' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:AwardingCriteriaResponse/cbc:AwardingCriteriaDescription" mode="M277" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:AwardingCriteriaResponse/cbc:AwardingCriteriaDescription" />

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
    <xsl:apply-templates mode="M277" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M277" priority="-1" />
  <xsl:template match="@*|node()" mode="M277" priority="-2">
    <xsl:apply-templates mode="M277" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:AwardingCriteriaResponse/cbc:AwardingCriteriaID" mode="M278" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:AwardingCriteriaResponse/cbc:AwardingCriteriaID" />

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
    <xsl:apply-templates mode="M278" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M278" priority="-1" />
  <xsl:template match="@*|node()" mode="M278" priority="-2">
    <xsl:apply-templates mode="M278" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:AwardingCriteriaResponse/cbc:Description" mode="M279" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:AwardingCriteriaResponse/cbc:Description" />

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
    <xsl:apply-templates mode="M279" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M279" priority="-1" />
  <xsl:template match="@*|node()" mode="M279" priority="-2">
    <xsl:apply-templates mode="M279" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:AwardingCriteriaResponse/cbc:ID" mode="M280" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:AwardingCriteriaResponse/cbc:ID" />

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
    <xsl:apply-templates mode="M280" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M280" priority="-1" />
  <xsl:template match="@*|node()" mode="M280" priority="-2">
    <xsl:apply-templates mode="M280" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:AwardingCriteriaResponse/cbc:Quantity" mode="M281" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:AwardingCriteriaResponse/cbc:Quantity" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:Quantity' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount" mode="M282" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:AllowanceTotalAmount' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:LegalMonetaryTotal/cbc:ChargeTotalAmount" mode="M283" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:LegalMonetaryTotal/cbc:ChargeTotalAmount" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:ChargeTotalAmount' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:LegalMonetaryTotal/cbc:LineExtensionAmount" mode="M284" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:LegalMonetaryTotal/cbc:LineExtensionAmount" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:LineExtensionAmount' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:LegalMonetaryTotal/cbc:PayableAlternativeAmount" mode="M285" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:LegalMonetaryTotal/cbc:PayableAlternativeAmount" />

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
    <xsl:apply-templates mode="M285" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M285" priority="-1" />
  <xsl:template match="@*|node()" mode="M285" priority="-2">
    <xsl:apply-templates mode="M285" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:LegalMonetaryTotal/cbc:PayableRoundingAmount" mode="M286" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:LegalMonetaryTotal/cbc:PayableRoundingAmount" />

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
    <xsl:apply-templates mode="M286" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M286" priority="-1" />
  <xsl:template match="@*|node()" mode="M286" priority="-2">
    <xsl:apply-templates mode="M286" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:LegalMonetaryTotal/cbc:PrepaidAmount" mode="M287" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:LegalMonetaryTotal/cbc:PrepaidAmount" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:PrepaidAmount' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:LegalMonetaryTotal/cbc:TaxExclusiveAmount" mode="M288" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:LegalMonetaryTotal/cbc:TaxExclusiveAmount" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:TaxExclusiveAmount' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:TaxTotal/cac:TaxSubtotal" mode="M289" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:TaxTotal/cac:TaxSubtotal" />

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
    <xsl:apply-templates mode="M289" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M289" priority="-1" />
  <xsl:template match="@*|node()" mode="M289" priority="-2">
    <xsl:apply-templates mode="M289" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:TaxTotal/cbc:RoundingAmount" mode="M290" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:TaxTotal/cbc:RoundingAmount" />

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
    <xsl:apply-templates mode="M290" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M290" priority="-1" />
  <xsl:template match="@*|node()" mode="M290" priority="-2">
    <xsl:apply-templates mode="M290" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:TaxTotal/cbc:TaxEvidenceIndicator" mode="M291" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:TaxTotal/cbc:TaxEvidenceIndicator" />

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
    <xsl:apply-templates mode="M291" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M291" priority="-1" />
  <xsl:template match="@*|node()" mode="M291" priority="-2">
    <xsl:apply-templates mode="M291" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:TaxTotal/cbc:TaxIncludedIndicator" mode="M292" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:TaxTotal/cbc:TaxIncludedIndicator" />

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
    <xsl:apply-templates mode="M292" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M292" priority="-1" />
  <xsl:template match="@*|node()" mode="M292" priority="-2">
    <xsl:apply-templates mode="M292" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:DocumentReference" mode="M293" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:DocumentReference" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:DocumentReference' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:AdditionalItemIdentification" mode="M294" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:AdditionalItemIdentification" />

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
    <xsl:apply-templates mode="M294" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M294" priority="-1" />
  <xsl:template match="@*|node()" mode="M294" priority="-2">
    <xsl:apply-templates mode="M294" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:AdditionalItemProperty" mode="M295" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:AdditionalItemProperty" />

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
    <xsl:apply-templates mode="M295" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M295" priority="-1" />
  <xsl:template match="@*|node()" mode="M295" priority="-2">
    <xsl:apply-templates mode="M295" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:BuyersItemIdentification" mode="M296" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:BuyersItemIdentification" />

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
    <xsl:apply-templates mode="M296" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M296" priority="-1" />
  <xsl:template match="@*|node()" mode="M296" priority="-2">
    <xsl:apply-templates mode="M296" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:CatalogueDocumentReference" mode="M297" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:CatalogueDocumentReference" />

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
    <xsl:apply-templates mode="M297" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M297" priority="-1" />
  <xsl:template match="@*|node()" mode="M297" priority="-2">
    <xsl:apply-templates mode="M297" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:CatalogueItemIdentification" mode="M298" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:CatalogueItemIdentification" />

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
    <xsl:apply-templates mode="M298" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M298" priority="-1" />
  <xsl:template match="@*|node()" mode="M298" priority="-2">
    <xsl:apply-templates mode="M298" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:Certificate" mode="M299" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:Certificate" />

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
    <xsl:apply-templates mode="M299" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M299" priority="-1" />
  <xsl:template match="@*|node()" mode="M299" priority="-2">
    <xsl:apply-templates mode="M299" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:ClassifiedTaxCategory" mode="M300" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:ClassifiedTaxCategory" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:ClassifiedTaxCategory' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:CommodityClassification" mode="M301" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:CommodityClassification" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:CommodityClassification' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:Dimension" mode="M302" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:Dimension" />

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
    <xsl:apply-templates mode="M302" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M302" priority="-1" />
  <xsl:template match="@*|node()" mode="M302" priority="-2">
    <xsl:apply-templates mode="M302" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:HazardousItem" mode="M303" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:HazardousItem" />

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
    <xsl:apply-templates mode="M303" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M303" priority="-1" />
  <xsl:template match="@*|node()" mode="M303" priority="-2">
    <xsl:apply-templates mode="M303" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:InformationContentProviderParty" mode="M304" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:InformationContentProviderParty" />

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
    <xsl:apply-templates mode="M304" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M304" priority="-1" />
  <xsl:template match="@*|node()" mode="M304" priority="-2">
    <xsl:apply-templates mode="M304" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:ItemInstance" mode="M305" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:ItemInstance" />

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
    <xsl:apply-templates mode="M305" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M305" priority="-1" />
  <xsl:template match="@*|node()" mode="M305" priority="-2">
    <xsl:apply-templates mode="M305" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:ItemSpecificationDocumentReference" mode="M306" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:ItemSpecificationDocumentReference" />

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
    <xsl:apply-templates mode="M306" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M306" priority="-1" />
  <xsl:template match="@*|node()" mode="M306" priority="-2">
    <xsl:apply-templates mode="M306" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:ManufacturerParty" mode="M307" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:ManufacturerParty" />

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
    <xsl:apply-templates mode="M307" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M307" priority="-1" />
  <xsl:template match="@*|node()" mode="M307" priority="-2">
    <xsl:apply-templates mode="M307" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:ManufacturersItemIdentification" mode="M308" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:ManufacturersItemIdentification" />

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
    <xsl:apply-templates mode="M308" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M308" priority="-1" />
  <xsl:template match="@*|node()" mode="M308" priority="-2">
    <xsl:apply-templates mode="M308" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:OriginAddress" mode="M309" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:OriginAddress" />

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
    <xsl:apply-templates mode="M309" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M309" priority="-1" />
  <xsl:template match="@*|node()" mode="M309" priority="-2">
    <xsl:apply-templates mode="M309" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:OriginCountry" mode="M310" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:OriginCountry" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:OriginCountry' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:SellersItemIdentification" mode="M311" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:SellersItemIdentification" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:SellersItemIdentification' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:StandardItemIdentification" mode="M312" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:StandardItemIdentification" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:StandardItemIdentification' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:TransactionConditions" mode="M313" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cac:TransactionConditions" />

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
    <xsl:apply-templates mode="M313" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M313" priority="-1" />
  <xsl:template match="@*|node()" mode="M313" priority="-2">
    <xsl:apply-templates mode="M313" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cbc:AdditionalInformation" mode="M314" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cbc:AdditionalInformation" />

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
    <xsl:apply-templates mode="M314" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M314" priority="-1" />
  <xsl:template match="@*|node()" mode="M314" priority="-2">
    <xsl:apply-templates mode="M314" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cbc:BrandName" mode="M315" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cbc:BrandName" />

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
    <xsl:apply-templates mode="M315" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M315" priority="-1" />
  <xsl:template match="@*|node()" mode="M315" priority="-2">
    <xsl:apply-templates mode="M315" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cbc:CatalogueIndicator" mode="M316" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cbc:CatalogueIndicator" />

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
    <xsl:apply-templates mode="M316" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M316" priority="-1" />
  <xsl:template match="@*|node()" mode="M316" priority="-2">
    <xsl:apply-templates mode="M316" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cbc:Description" mode="M317" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cbc:Description" />

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
    <xsl:apply-templates mode="M317" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M317" priority="-1" />
  <xsl:template match="@*|node()" mode="M317" priority="-2">
    <xsl:apply-templates mode="M317" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cbc:HazardousRiskIndicator" mode="M318" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cbc:HazardousRiskIndicator" />

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
    <xsl:apply-templates mode="M318" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M318" priority="-1" />
  <xsl:template match="@*|node()" mode="M318" priority="-2">
    <xsl:apply-templates mode="M318" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cbc:Keyword" mode="M319" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cbc:Keyword" />

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
    <xsl:apply-templates mode="M319" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M319" priority="-1" />
  <xsl:template match="@*|node()" mode="M319" priority="-2">
    <xsl:apply-templates mode="M319" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cbc:ModelName" mode="M320" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cbc:ModelName" />

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
    <xsl:apply-templates mode="M320" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M320" priority="-1" />
  <xsl:template match="@*|node()" mode="M320" priority="-2">
    <xsl:apply-templates mode="M320" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cbc:Name" mode="M321" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cbc:Name" />

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
    <xsl:apply-templates mode="M321" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M321" priority="-1" />
  <xsl:template match="@*|node()" mode="M321" priority="-2">
    <xsl:apply-templates mode="M321" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cbc:PackQuantity" mode="M322" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cbc:PackQuantity" />

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
    <xsl:apply-templates mode="M322" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M322" priority="-1" />
  <xsl:template match="@*|node()" mode="M322" priority="-2">
    <xsl:apply-templates mode="M322" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cbc:PackSizeNumeric" mode="M323" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:Item/cbc:PackSizeNumeric" />

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
    <xsl:apply-templates mode="M323" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M323" priority="-1" />
  <xsl:template match="@*|node()" mode="M323" priority="-2">
    <xsl:apply-templates mode="M323" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:OfferedItemLocationQuantity" mode="M324" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:OfferedItemLocationQuantity" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:OfferedItemLocationQuantity' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:ReplacementRelatedItem" mode="M325" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:ReplacementRelatedItem" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:ReplacementRelatedItem' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:SubTenderLine" mode="M326" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:SubTenderLine" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:SubTenderLine' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:WarrantyParty" mode="M327" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:WarrantyParty" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:WarrantyParty' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:WarrantyValidityPeriod" mode="M328" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cac:WarrantyValidityPeriod" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cac:WarrantyValidityPeriod' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:TenderLine/cbc:ContentUnitQuantity" mode="M329" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cbc:ContentUnitQuantity" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:ContentUnitQuantity' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:TenderLine/cbc:ID" mode="M330" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cbc:ID" />

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
    <xsl:apply-templates mode="M330" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M330" priority="-1" />
  <xsl:template match="@*|node()" mode="M330" priority="-2">
    <xsl:apply-templates mode="M330" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:TenderLine/cbc:MaximumOrderQuantity" mode="M331" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cbc:MaximumOrderQuantity" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:MaximumOrderQuantity' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:TenderLine/cbc:MinimumOrderQuantity" mode="M332" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cbc:MinimumOrderQuantity" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:MinimumOrderQuantity' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:TenderLine/cbc:Note" mode="M333" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cbc:Note" />

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
    <xsl:apply-templates mode="M333" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M333" priority="-1" />
  <xsl:template match="@*|node()" mode="M333" priority="-2">
    <xsl:apply-templates mode="M333" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:TenderLine/cbc:OrderQuantityIncrementNumeric" mode="M334" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cbc:OrderQuantityIncrementNumeric" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:OrderQuantityIncrementNumeric' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:TenderLine/cbc:OrderableUnit" mode="M335" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cbc:OrderableUnit" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:OrderableUnit' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:TenderLine/cbc:PackLevelCode" mode="M336" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cbc:PackLevelCode" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:PackLevelCode' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:TenderLine/cbc:Quantity" mode="M337" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cbc:Quantity" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:Quantity' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:TenderedProject/cac:TenderLine/cbc:WarrantyInformation" mode="M338" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cac:TenderLine/cbc:WarrantyInformation" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:WarrantyInformation' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:TenderedProject/cbc:FeeDescription" mode="M339" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cbc:FeeDescription" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:FeeDescription' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:TenderedProject/cbc:ProcurementProjectLotID" mode="M340" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cbc:ProcurementProjectLotID" />

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
    <xsl:apply-templates mode="M340" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M340" priority="-1" />
  <xsl:template match="@*|node()" mode="M340" priority="-2">
    <xsl:apply-templates mode="M340" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TenderedProject/cbc:VariantID" mode="M341" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TenderedProject/cbc:VariantID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:VariantID' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:TendererParty/cac:AgentParty" mode="M342" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:AgentParty" />

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
    <xsl:apply-templates mode="M342" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M342" priority="-1" />
  <xsl:template match="@*|node()" mode="M342" priority="-2">
    <xsl:apply-templates mode="M342" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:Contact/cac:OtherCommunication" mode="M343" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:Contact/cac:OtherCommunication" />

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
    <xsl:apply-templates mode="M343" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M343" priority="-1" />
  <xsl:template match="@*|node()" mode="M343" priority="-2">
    <xsl:apply-templates mode="M343" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:Contact/cbc:ElectronicMail" mode="M344" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:Contact/cbc:ElectronicMail" />

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
    <xsl:apply-templates mode="M344" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M344" priority="-1" />
  <xsl:template match="@*|node()" mode="M344" priority="-2">
    <xsl:apply-templates mode="M344" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:Contact/cbc:ID" mode="M345" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:Contact/cbc:ID" />

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
    <xsl:apply-templates mode="M345" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M345" priority="-1" />
  <xsl:template match="@*|node()" mode="M345" priority="-2">
    <xsl:apply-templates mode="M345" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:Contact/cbc:Name" mode="M346" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:Contact/cbc:Name" />

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
<xsl:template match="/p1:Tender/cac:TendererParty/cac:Contact/cbc:Note" mode="M347" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:Contact/cbc:Note" />

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
    <xsl:apply-templates mode="M347" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M347" priority="-1" />
  <xsl:template match="@*|node()" mode="M347" priority="-2">
    <xsl:apply-templates mode="M347" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:Contact/cbc:Telefax" mode="M348" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:Contact/cbc:Telefax" />

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
    <xsl:apply-templates mode="M348" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M348" priority="-1" />
  <xsl:template match="@*|node()" mode="M348" priority="-2">
    <xsl:apply-templates mode="M348" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:Contact/cbc:Telephone" mode="M349" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:Contact/cbc:Telephone" />

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
    <xsl:apply-templates mode="M349" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M349" priority="-1" />
  <xsl:template match="@*|node()" mode="M349" priority="-2">
    <xsl:apply-templates mode="M349" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:FinancialAccount" mode="M350" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:FinancialAccount" />

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
    <xsl:apply-templates mode="M350" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M350" priority="-1" />
  <xsl:template match="@*|node()" mode="M350" priority="-2">
    <xsl:apply-templates mode="M350" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:Language" mode="M351" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:Language" />

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
    <xsl:apply-templates mode="M351" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M351" priority="-1" />
  <xsl:template match="@*|node()" mode="M351" priority="-2">
    <xsl:apply-templates mode="M351" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PartyIdentification/cbc:ID" mode="M352" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PartyIdentification/cbc:ID" />

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
    <xsl:apply-templates mode="M352" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M352" priority="-1" />
  <xsl:template match="@*|node()" mode="M352" priority="-2">
    <xsl:apply-templates mode="M352" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:CorporateRegistrationScheme" mode="M353" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:CorporateRegistrationScheme" />

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
    <xsl:apply-templates mode="M353" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M353" priority="-1" />
  <xsl:template match="@*|node()" mode="M353" priority="-2">
    <xsl:apply-templates mode="M353" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:HeadParty" mode="M354" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:HeadParty" />

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
    <xsl:apply-templates mode="M354" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M354" priority="-1" />
  <xsl:template match="@*|node()" mode="M354" priority="-2">
    <xsl:apply-templates mode="M354" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine" mode="M355" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine" />

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
    <xsl:apply-templates mode="M355" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M355" priority="-1" />
  <xsl:template match="@*|node()" mode="M355" priority="-2">
    <xsl:apply-templates mode="M355" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode" mode="M356" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:IdentificationCode" />

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
    <xsl:apply-templates mode="M356" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M356" priority="-1" />
  <xsl:template match="@*|node()" mode="M356" priority="-2">
    <xsl:apply-templates mode="M356" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:Name" mode="M357" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:Name" />

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
    <xsl:apply-templates mode="M357" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M357" priority="-1" />
  <xsl:template match="@*|node()" mode="M357" priority="-2">
    <xsl:apply-templates mode="M357" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:LocationCoordinate" mode="M358" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cac:LocationCoordinate" />

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
    <xsl:apply-templates mode="M358" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M358" priority="-1" />
  <xsl:template match="@*|node()" mode="M358" priority="-2">
    <xsl:apply-templates mode="M358" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AdditionalStreetName" mode="M359" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AdditionalStreetName" />

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
    <xsl:apply-templates mode="M359" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M359" priority="-1" />
  <xsl:template match="@*|node()" mode="M359" priority="-2">
    <xsl:apply-templates mode="M359" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressFormatCode" mode="M360" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressFormatCode" />

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
    <xsl:apply-templates mode="M360" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M360" priority="-1" />
  <xsl:template match="@*|node()" mode="M360" priority="-2">
    <xsl:apply-templates mode="M360" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressTypeCode" mode="M361" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressTypeCode" />

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
    <xsl:apply-templates mode="M361" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M361" priority="-1" />
  <xsl:template match="@*|node()" mode="M361" priority="-2">
    <xsl:apply-templates mode="M361" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BlockName" mode="M362" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BlockName" />

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
    <xsl:apply-templates mode="M362" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M362" priority="-1" />
  <xsl:template match="@*|node()" mode="M362" priority="-2">
    <xsl:apply-templates mode="M362" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingName" mode="M363" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingName" />

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
    <xsl:apply-templates mode="M363" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M363" priority="-1" />
  <xsl:template match="@*|node()" mode="M363" priority="-2">
    <xsl:apply-templates mode="M363" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingNumber" mode="M364" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingNumber" />

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
    <xsl:apply-templates mode="M364" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M364" priority="-1" />
  <xsl:template match="@*|node()" mode="M364" priority="-2">
    <xsl:apply-templates mode="M364" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName" mode="M365" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:CityName' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CitySubdivisionName" mode="M366" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CitySubdivisionName" />

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
    <xsl:apply-templates mode="M366" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M366" priority="-1" />
  <xsl:template match="@*|node()" mode="M366" priority="-2">
    <xsl:apply-templates mode="M366" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity" mode="M367" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity" />

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
    <xsl:apply-templates mode="M367" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M367" priority="-1" />
  <xsl:template match="@*|node()" mode="M367" priority="-2">
    <xsl:apply-templates mode="M367" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentityCode" mode="M368" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentityCode" />

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
    <xsl:apply-templates mode="M368" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M368" priority="-1" />
  <xsl:template match="@*|node()" mode="M368" priority="-2">
    <xsl:apply-templates mode="M368" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Department" mode="M369" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Department" />

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
    <xsl:apply-templates mode="M369" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M369" priority="-1" />
  <xsl:template match="@*|node()" mode="M369" priority="-2">
    <xsl:apply-templates mode="M369" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District" mode="M370" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District" />

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
    <xsl:apply-templates mode="M370" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M370" priority="-1" />
  <xsl:template match="@*|node()" mode="M370" priority="-2">
    <xsl:apply-templates mode="M370" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Floor" mode="M371" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Floor" />

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
    <xsl:apply-templates mode="M371" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M371" priority="-1" />
  <xsl:template match="@*|node()" mode="M371" priority="-2">
    <xsl:apply-templates mode="M371" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:ID" mode="M372" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:ID" />

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
    <xsl:apply-templates mode="M372" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M372" priority="-1" />
  <xsl:template match="@*|node()" mode="M372" priority="-2">
    <xsl:apply-templates mode="M372" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:InhouseMail" mode="M373" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:InhouseMail" />

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
    <xsl:apply-templates mode="M373" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M373" priority="-1" />
  <xsl:template match="@*|node()" mode="M373" priority="-2">
    <xsl:apply-templates mode="M373" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkAttention" mode="M374" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkAttention" />

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
    <xsl:apply-templates mode="M374" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M374" priority="-1" />
  <xsl:template match="@*|node()" mode="M374" priority="-2">
    <xsl:apply-templates mode="M374" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkCare" mode="M375" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkCare" />

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
    <xsl:apply-templates mode="M375" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M375" priority="-1" />
  <xsl:template match="@*|node()" mode="M375" priority="-2">
    <xsl:apply-templates mode="M375" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PlotIdentification" mode="M376" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PlotIdentification" />

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
    <xsl:apply-templates mode="M376" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M376" priority="-1" />
  <xsl:template match="@*|node()" mode="M376" priority="-2">
    <xsl:apply-templates mode="M376" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PostalZone" mode="M377" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PostalZone" />

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
    <xsl:apply-templates mode="M377" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M377" priority="-1" />
  <xsl:template match="@*|node()" mode="M377" priority="-2">
    <xsl:apply-templates mode="M377" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Postbox" mode="M378" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Postbox" />

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
    <xsl:apply-templates mode="M378" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M378" priority="-1" />
  <xsl:template match="@*|node()" mode="M378" priority="-2">
    <xsl:apply-templates mode="M378" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Region" mode="M379" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Region" />

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
    <xsl:apply-templates mode="M379" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M379" priority="-1" />
  <xsl:template match="@*|node()" mode="M379" priority="-2">
    <xsl:apply-templates mode="M379" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Room" mode="M380" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Room" />

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
    <xsl:apply-templates mode="M380" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M380" priority="-1" />
  <xsl:template match="@*|node()" mode="M380" priority="-2">
    <xsl:apply-templates mode="M380" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:StreetName" mode="M381" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:StreetName" />

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
    <xsl:apply-templates mode="M381" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M381" priority="-1" />
  <xsl:template match="@*|node()" mode="M381" priority="-2">
    <xsl:apply-templates mode="M381" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:TimezoneOffset" mode="M382" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:TimezoneOffset" />

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
    <xsl:apply-templates mode="M382" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M382" priority="-1" />
  <xsl:template match="@*|node()" mode="M382" priority="-2">
    <xsl:apply-templates mode="M382" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:ShareholderParty" mode="M383" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cac:ShareholderParty" />

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
    <xsl:apply-templates mode="M383" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M383" priority="-1" />
  <xsl:template match="@*|node()" mode="M383" priority="-2">
    <xsl:apply-templates mode="M383" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cbc:CompanyID" mode="M384" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cbc:CompanyID" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:CompanyID' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cbc:CompanyLegalFormCode" mode="M385" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cbc:CompanyLegalFormCode" />

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
    <xsl:apply-templates mode="M385" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M385" priority="-1" />
  <xsl:template match="@*|node()" mode="M385" priority="-2">
    <xsl:apply-templates mode="M385" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cbc:CompanyLiquidationStatusCode" mode="M386" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cbc:CompanyLiquidationStatusCode" />

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
    <xsl:apply-templates mode="M386" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M386" priority="-1" />
  <xsl:template match="@*|node()" mode="M386" priority="-2">
    <xsl:apply-templates mode="M386" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cbc:CorporateStockAmount" mode="M387" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cbc:CorporateStockAmount" />

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
    <xsl:apply-templates mode="M387" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M387" priority="-1" />
  <xsl:template match="@*|node()" mode="M387" priority="-2">
    <xsl:apply-templates mode="M387" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cbc:FullyPaidSharesIndicator" mode="M388" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cbc:FullyPaidSharesIndicator" />

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
    <xsl:apply-templates mode="M388" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M388" priority="-1" />
  <xsl:template match="@*|node()" mode="M388" priority="-2">
    <xsl:apply-templates mode="M388" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cbc:RegistrationDate" mode="M389" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cbc:RegistrationDate" />

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
    <xsl:apply-templates mode="M389" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M389" priority="-1" />
  <xsl:template match="@*|node()" mode="M389" priority="-2">
    <xsl:apply-templates mode="M389" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cbc:RegistrationExpirationDate" mode="M390" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cbc:RegistrationExpirationDate" />

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
    <xsl:apply-templates mode="M390" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M390" priority="-1" />
  <xsl:template match="@*|node()" mode="M390" priority="-2">
    <xsl:apply-templates mode="M390" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cbc:RegistrationName" mode="M391" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cbc:RegistrationName" />

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
    <xsl:apply-templates mode="M391" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M391" priority="-1" />
  <xsl:template match="@*|node()" mode="M391" priority="-2">
    <xsl:apply-templates mode="M391" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cbc:SoleProprietorshipIndicator" mode="M392" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PartyLegalEntity/cbc:SoleProprietorshipIndicator" />

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
    <xsl:apply-templates mode="M392" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M392" priority="-1" />
  <xsl:template match="@*|node()" mode="M392" priority="-2">
    <xsl:apply-templates mode="M392" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PartyName/cbc:Name" mode="M393" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PartyName/cbc:Name" />

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
    <xsl:apply-templates mode="M393" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M393" priority="-1" />
  <xsl:template match="@*|node()" mode="M393" priority="-2">
    <xsl:apply-templates mode="M393" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PartyTaxScheme" mode="M394" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PartyTaxScheme" />

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
    <xsl:apply-templates mode="M394" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M394" priority="-1" />
  <xsl:template match="@*|node()" mode="M394" priority="-2">
    <xsl:apply-templates mode="M394" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:Person" mode="M395" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:Person" />

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
    <xsl:apply-templates mode="M395" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M395" priority="-1" />
  <xsl:template match="@*|node()" mode="M395" priority="-2">
    <xsl:apply-templates mode="M395" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PhysicalLocation" mode="M396" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PhysicalLocation" />

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
    <xsl:apply-templates mode="M396" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M396" priority="-1" />
  <xsl:template match="@*|node()" mode="M396" priority="-2">
    <xsl:apply-templates mode="M396" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PostalAddress/cac:AddressLine" mode="M397" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cac:AddressLine" />

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
    <xsl:apply-templates mode="M397" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M397" priority="-1" />
  <xsl:template match="@*|node()" mode="M397" priority="-2">
    <xsl:apply-templates mode="M397" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode" mode="M398" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode" />

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
    <xsl:apply-templates mode="M398" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M398" priority="-1" />
  <xsl:template match="@*|node()" mode="M398" priority="-2">
    <xsl:apply-templates mode="M398" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PostalAddress/cac:Country/cbc:Name" mode="M399" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cac:Country/cbc:Name" />

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
    <xsl:apply-templates mode="M399" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M399" priority="-1" />
  <xsl:template match="@*|node()" mode="M399" priority="-2">
    <xsl:apply-templates mode="M399" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PostalAddress/cac:LocationCoordinate" mode="M400" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cac:LocationCoordinate" />

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
    <xsl:apply-templates mode="M400" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M400" priority="-1" />
  <xsl:template match="@*|node()" mode="M400" priority="-2">
    <xsl:apply-templates mode="M400" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:AdditionalStreetName" mode="M401" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:AdditionalStreetName" />

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
    <xsl:apply-templates mode="M401" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M401" priority="-1" />
  <xsl:template match="@*|node()" mode="M401" priority="-2">
    <xsl:apply-templates mode="M401" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:AddressFormatCode" mode="M402" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:AddressFormatCode" />

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
    <xsl:apply-templates mode="M402" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M402" priority="-1" />
  <xsl:template match="@*|node()" mode="M402" priority="-2">
    <xsl:apply-templates mode="M402" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:AddressTypeCode" mode="M403" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:AddressTypeCode" />

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
    <xsl:apply-templates mode="M403" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M403" priority="-1" />
  <xsl:template match="@*|node()" mode="M403" priority="-2">
    <xsl:apply-templates mode="M403" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:BlockName" mode="M404" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:BlockName" />

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
    <xsl:apply-templates mode="M404" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M404" priority="-1" />
  <xsl:template match="@*|node()" mode="M404" priority="-2">
    <xsl:apply-templates mode="M404" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:BuildingName" mode="M405" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:BuildingName" />

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
    <xsl:apply-templates mode="M405" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M405" priority="-1" />
  <xsl:template match="@*|node()" mode="M405" priority="-2">
    <xsl:apply-templates mode="M405" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:BuildingNumber" mode="M406" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:BuildingNumber" />

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
    <xsl:apply-templates mode="M406" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M406" priority="-1" />
  <xsl:template match="@*|node()" mode="M406" priority="-2">
    <xsl:apply-templates mode="M406" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:CityName" mode="M407" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:CityName" />

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
    <xsl:apply-templates mode="M407" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M407" priority="-1" />
  <xsl:template match="@*|node()" mode="M407" priority="-2">
    <xsl:apply-templates mode="M407" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:CitySubdivisionName" mode="M408" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:CitySubdivisionName" />

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
    <xsl:apply-templates mode="M408" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M408" priority="-1" />
  <xsl:template match="@*|node()" mode="M408" priority="-2">
    <xsl:apply-templates mode="M408" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:CountrySubentity" mode="M409" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:CountrySubentity" />

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
    <xsl:apply-templates mode="M409" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M409" priority="-1" />
  <xsl:template match="@*|node()" mode="M409" priority="-2">
    <xsl:apply-templates mode="M409" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:CountrySubentityCode" mode="M410" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:CountrySubentityCode" />

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
    <xsl:apply-templates mode="M410" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M410" priority="-1" />
  <xsl:template match="@*|node()" mode="M410" priority="-2">
    <xsl:apply-templates mode="M410" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:Department" mode="M411" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:Department" />

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
    <xsl:apply-templates mode="M411" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M411" priority="-1" />
  <xsl:template match="@*|node()" mode="M411" priority="-2">
    <xsl:apply-templates mode="M411" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:District" mode="M412" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:District" />

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
    <xsl:apply-templates mode="M412" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M412" priority="-1" />
  <xsl:template match="@*|node()" mode="M412" priority="-2">
    <xsl:apply-templates mode="M412" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:Floor" mode="M413" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:Floor" />

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
    <xsl:apply-templates mode="M413" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M413" priority="-1" />
  <xsl:template match="@*|node()" mode="M413" priority="-2">
    <xsl:apply-templates mode="M413" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:ID" mode="M414" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:ID" />

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
    <xsl:apply-templates mode="M414" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M414" priority="-1" />
  <xsl:template match="@*|node()" mode="M414" priority="-2">
    <xsl:apply-templates mode="M414" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:InhouseMail" mode="M415" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:InhouseMail" />

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
    <xsl:apply-templates mode="M415" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M415" priority="-1" />
  <xsl:template match="@*|node()" mode="M415" priority="-2">
    <xsl:apply-templates mode="M415" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:MarkAttention" mode="M416" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:MarkAttention" />

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
    <xsl:apply-templates mode="M416" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M416" priority="-1" />
  <xsl:template match="@*|node()" mode="M416" priority="-2">
    <xsl:apply-templates mode="M416" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:MarkCare" mode="M417" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:MarkCare" />

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
    <xsl:apply-templates mode="M417" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M417" priority="-1" />
  <xsl:template match="@*|node()" mode="M417" priority="-2">
    <xsl:apply-templates mode="M417" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:PlotIdentification" mode="M418" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:PlotIdentification" />

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
    <xsl:apply-templates mode="M418" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M418" priority="-1" />
  <xsl:template match="@*|node()" mode="M418" priority="-2">
    <xsl:apply-templates mode="M418" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:PostalZone" mode="M419" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:PostalZone" />

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
    <xsl:apply-templates mode="M419" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M419" priority="-1" />
  <xsl:template match="@*|node()" mode="M419" priority="-2">
    <xsl:apply-templates mode="M419" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:Postbox" mode="M420" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:Postbox" />

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
    <xsl:apply-templates mode="M420" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M420" priority="-1" />
  <xsl:template match="@*|node()" mode="M420" priority="-2">
    <xsl:apply-templates mode="M420" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:Region" mode="M421" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:Region" />

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
    <xsl:apply-templates mode="M421" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M421" priority="-1" />
  <xsl:template match="@*|node()" mode="M421" priority="-2">
    <xsl:apply-templates mode="M421" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:Room" mode="M422" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:Room" />

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
    <xsl:apply-templates mode="M422" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M422" priority="-1" />
  <xsl:template match="@*|node()" mode="M422" priority="-2">
    <xsl:apply-templates mode="M422" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:StreetName" mode="M423" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:StreetName" />

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
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:TimezoneOffset" mode="M424" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PostalAddress/cbc:TimezoneOffset" />

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
    <xsl:apply-templates mode="M424" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M424" priority="-1" />
  <xsl:template match="@*|node()" mode="M424" priority="-2">
    <xsl:apply-templates mode="M424" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:PowerOfAttorney" mode="M425" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:PowerOfAttorney" />

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
    <xsl:apply-templates mode="M425" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M425" priority="-1" />
  <xsl:template match="@*|node()" mode="M425" priority="-2">
    <xsl:apply-templates mode="M425" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cac:ServiceProviderParty" mode="M426" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cac:ServiceProviderParty" />

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
    <xsl:apply-templates mode="M426" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M426" priority="-1" />
  <xsl:template match="@*|node()" mode="M426" priority="-2">
    <xsl:apply-templates mode="M426" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cbc:EndpointID" mode="M427" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cbc:EndpointID" />

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
    <xsl:apply-templates mode="M427" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M427" priority="-1" />
  <xsl:template match="@*|node()" mode="M427" priority="-2">
    <xsl:apply-templates mode="M427" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cbc:IndustryClassificationCode" mode="M428" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cbc:IndustryClassificationCode" />

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
    <xsl:apply-templates mode="M428" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M428" priority="-1" />
  <xsl:template match="@*|node()" mode="M428" priority="-2">
    <xsl:apply-templates mode="M428" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cbc:LogoReferenceID" mode="M429" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cbc:LogoReferenceID" />

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
    <xsl:apply-templates mode="M429" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M429" priority="-1" />
  <xsl:template match="@*|node()" mode="M429" priority="-2">
    <xsl:apply-templates mode="M429" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cbc:MarkAttentionIndicator" mode="M430" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cbc:MarkAttentionIndicator" />

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
    <xsl:apply-templates mode="M430" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M430" priority="-1" />
  <xsl:template match="@*|node()" mode="M430" priority="-2">
    <xsl:apply-templates mode="M430" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cbc:MarkCareIndicator" mode="M431" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cbc:MarkCareIndicator" />

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
    <xsl:apply-templates mode="M431" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M431" priority="-1" />
  <xsl:template match="@*|node()" mode="M431" priority="-2">
    <xsl:apply-templates mode="M431" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:TendererParty/cbc:WebsiteURI" mode="M432" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:TendererParty/cbc:WebsiteURI" />

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
    <xsl:apply-templates mode="M432" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M432" priority="-1" />
  <xsl:template match="@*|node()" mode="M432" priority="-2">
    <xsl:apply-templates mode="M432" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ValidityPeriod/cbc:Description" mode="M433" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ValidityPeriod/cbc:Description" />

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
    <xsl:apply-templates mode="M433" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M433" priority="-1" />
  <xsl:template match="@*|node()" mode="M433" priority="-2">
    <xsl:apply-templates mode="M433" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ValidityPeriod/cbc:DescriptionCode" mode="M434" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ValidityPeriod/cbc:DescriptionCode" />

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
    <xsl:apply-templates mode="M434" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M434" priority="-1" />
  <xsl:template match="@*|node()" mode="M434" priority="-2">
    <xsl:apply-templates mode="M434" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ValidityPeriod/cbc:DurationMeasure" mode="M435" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ValidityPeriod/cbc:DurationMeasure" />

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
    <xsl:apply-templates mode="M435" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M435" priority="-1" />
  <xsl:template match="@*|node()" mode="M435" priority="-2">
    <xsl:apply-templates mode="M435" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ValidityPeriod/cbc:EndTime" mode="M436" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ValidityPeriod/cbc:EndTime" />

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
    <xsl:apply-templates mode="M436" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M436" priority="-1" />
  <xsl:template match="@*|node()" mode="M436" priority="-2">
    <xsl:apply-templates mode="M436" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cac:ValidityPeriod/cbc:StartTime" mode="M437" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cac:ValidityPeriod/cbc:StartTime" />

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
    <xsl:apply-templates mode="M437" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M437" priority="-1" />
  <xsl:template match="@*|node()" mode="M437" priority="-2">
    <xsl:apply-templates mode="M437" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cbc:ContractFolderID" mode="M438" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cbc:ContractFolderID" />

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
    <xsl:apply-templates mode="M438" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M438" priority="-1" />
  <xsl:template match="@*|node()" mode="M438" priority="-2">
    <xsl:apply-templates mode="M438" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cbc:ContractName" mode="M439" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cbc:ContractName" />

		<!--REPORT -->
<xsl:if test=".">
      <svrl:successful-report test=".">
        <xsl:attribute name="flag">warning</xsl:attribute>
        <xsl:attribute name="location">
          <xsl:apply-templates mode="schematron-select-full-path" select="." />
        </xsl:attribute>
        <svrl:text>
	Element 'cbc:ContractName' is marked as not used in the given context.</svrl:text>
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
<xsl:template match="/p1:Tender/cbc:CopyIndicator" mode="M440" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cbc:CopyIndicator" />

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
    <xsl:apply-templates mode="M440" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M440" priority="-1" />
  <xsl:template match="@*|node()" mode="M440" priority="-2">
    <xsl:apply-templates mode="M440" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cbc:CustomizationID" mode="M441" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cbc:CustomizationID" />

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
    <xsl:apply-templates mode="M441" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M441" priority="-1" />
  <xsl:template match="@*|node()" mode="M441" priority="-2">
    <xsl:apply-templates mode="M441" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cbc:ID" mode="M442" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cbc:ID" />

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
    <xsl:apply-templates mode="M442" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M442" priority="-1" />
  <xsl:template match="@*|node()" mode="M442" priority="-2">
    <xsl:apply-templates mode="M442" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cbc:Note" mode="M443" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cbc:Note" />

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
    <xsl:apply-templates mode="M443" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M443" priority="-1" />
  <xsl:template match="@*|node()" mode="M443" priority="-2">
    <xsl:apply-templates mode="M443" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cbc:ProfileExecutionID" mode="M444" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cbc:ProfileExecutionID" />

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
    <xsl:apply-templates mode="M444" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M444" priority="-1" />
  <xsl:template match="@*|node()" mode="M444" priority="-2">
    <xsl:apply-templates mode="M444" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cbc:ProfileID" mode="M445" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cbc:ProfileID" />

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
    <xsl:apply-templates mode="M445" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M445" priority="-1" />
  <xsl:template match="@*|node()" mode="M445" priority="-2">
    <xsl:apply-templates mode="M445" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cbc:TenderTypeCode" mode="M446" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cbc:TenderTypeCode" />

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
    <xsl:apply-templates mode="M446" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M446" priority="-1" />
  <xsl:template match="@*|node()" mode="M446" priority="-2">
    <xsl:apply-templates mode="M446" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cbc:UBLVersionID" mode="M447" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cbc:UBLVersionID" />

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
    <xsl:apply-templates mode="M447" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M447" priority="-1" />
  <xsl:template match="@*|node()" mode="M447" priority="-2">
    <xsl:apply-templates mode="M447" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/cbc:UUID" mode="M448" priority="1000">
    <svrl:fired-rule context="/p1:Tender/cbc:UUID" />

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
    <xsl:apply-templates mode="M448" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M448" priority="-1" />
  <xsl:template match="@*|node()" mode="M448" priority="-2">
    <xsl:apply-templates mode="M448" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:Tender/ext:UBLExtensions" mode="M449" priority="1000">
    <svrl:fired-rule context="/p1:Tender/ext:UBLExtensions" />

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
    <xsl:apply-templates mode="M449" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M449" priority="-1" />
  <xsl:template match="@*|node()" mode="M449" priority="-2">
    <xsl:apply-templates mode="M449" select="*|comment()|processing-instruction()" />
  </xsl:template>
</xsl:stylesheet>
