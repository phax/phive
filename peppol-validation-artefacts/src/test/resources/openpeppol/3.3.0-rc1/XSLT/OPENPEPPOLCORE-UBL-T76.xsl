<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:schold="http://www.ascc.net/xml/schematron"
                xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                xmlns:xhtml="http://www.w3.org/1999/xhtml"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
                xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
                xmlns:p1="urn:oasis:names:specification:ubl:schema:xsd:OrderResponse-2"
                xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDataTypes-2"
                xmlns:udt="urn:oasis:names:specification:ubl:schema:xsd:UnqualifiedDataTypes-2"
                xmlns:ccts-cct="urn:un:unece:uncefact:data:specification:CoreComponentTypeSchemaModule:2"
                xmlns:ccts="urn:un:unece:uncefact:documentation:2"
                version="1.0"><!--Implementers: please note that overriding process-prolog or process-root is 
    the preferred method for meta-stylesheets to use where possible. -->
   <xsl:param name="archiveDirParameter"/>
   <xsl:param name="archiveNameParameter"/>
   <xsl:param name="fileNameParameter"/>
   <xsl:param name="fileDirParameter"/>
   <xsl:variable name="document-uri">
      <xsl:value-of select="document-uri(/)"/>
   </xsl:variable>

   <!--PHASES-->


   <!--PROLOG-->
   <xsl:output xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
               method="xml"
               omit-xml-declaration="no"
               standalone="yes"
               indent="yes"/>

   <!--XSD TYPES FOR XSLT2-->


   <!--KEYS AND FUNCTIONS-->


   <!--DEFAULT RULES-->


   <!--MODE: SCHEMATRON-SELECT-FULL-PATH-->
   <!--This mode can be used to generate an ugly though full XPath for locators-->
   <xsl:template match="*" mode="schematron-select-full-path">
      <xsl:apply-templates select="." mode="schematron-get-full-path"/>
   </xsl:template>

   <!--MODE: SCHEMATRON-FULL-PATH-->
   <!--This mode can be used to generate an ugly though full XPath for locators-->
   <xsl:template match="*" mode="schematron-get-full-path">
      <xsl:apply-templates select="parent::*" mode="schematron-get-full-path"/>
      <xsl:text>/</xsl:text>
      <xsl:choose>
         <xsl:when test="namespace-uri()=''">
            <xsl:value-of select="name()"/>
            <xsl:variable name="p_1"
                          select="1+    count(preceding-sibling::*[name()=name(current())])"/>
            <xsl:if test="$p_1&gt;1 or following-sibling::*[name()=name(current())]">[<xsl:value-of select="$p_1"/>]</xsl:if>
         </xsl:when>
         <xsl:otherwise>
            <xsl:text>*[local-name()='</xsl:text>
            <xsl:value-of select="local-name()"/>
            <xsl:text>']</xsl:text>
            <xsl:variable name="p_2"
                          select="1+   count(preceding-sibling::*[local-name()=local-name(current())])"/>
            <xsl:if test="$p_2&gt;1 or following-sibling::*[local-name()=local-name(current())]">[<xsl:value-of select="$p_2"/>]</xsl:if>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="@*" mode="schematron-get-full-path">
      <xsl:text>/</xsl:text>
      <xsl:choose>
         <xsl:when test="namespace-uri()=''">@<xsl:value-of select="name()"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:text>@*[local-name()='</xsl:text>
            <xsl:value-of select="local-name()"/>
            <xsl:text>' and namespace-uri()='</xsl:text>
            <xsl:value-of select="namespace-uri()"/>
            <xsl:text>']</xsl:text>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <!--MODE: SCHEMATRON-FULL-PATH-2-->
   <!--This mode can be used to generate prefixed XPath for humans-->
   <xsl:template match="node() | @*" mode="schematron-get-full-path-2">
      <xsl:for-each select="ancestor-or-self::*">
         <xsl:text>/</xsl:text>
         <xsl:value-of select="name(.)"/>
         <xsl:if test="preceding-sibling::*[name(.)=name(current())]">
            <xsl:text>[</xsl:text>
            <xsl:value-of select="count(preceding-sibling::*[name(.)=name(current())])+1"/>
            <xsl:text>]</xsl:text>
         </xsl:if>
      </xsl:for-each>
      <xsl:if test="not(self::*)">
         <xsl:text/>/@<xsl:value-of select="name(.)"/>
      </xsl:if>
   </xsl:template>
   <!--MODE: SCHEMATRON-FULL-PATH-3-->
   <!--This mode can be used to generate prefixed XPath for humans 
	(Top-level element has index)-->
   <xsl:template match="node() | @*" mode="schematron-get-full-path-3">
      <xsl:for-each select="ancestor-or-self::*">
         <xsl:text>/</xsl:text>
         <xsl:value-of select="name(.)"/>
         <xsl:if test="parent::*">
            <xsl:text>[</xsl:text>
            <xsl:value-of select="count(preceding-sibling::*[name(.)=name(current())])+1"/>
            <xsl:text>]</xsl:text>
         </xsl:if>
      </xsl:for-each>
      <xsl:if test="not(self::*)">
         <xsl:text/>/@<xsl:value-of select="name(.)"/>
      </xsl:if>
   </xsl:template>

   <!--MODE: GENERATE-ID-FROM-PATH -->
   <xsl:template match="/" mode="generate-id-from-path"/>
   <xsl:template match="text()" mode="generate-id-from-path">
      <xsl:apply-templates select="parent::*" mode="generate-id-from-path"/>
      <xsl:value-of select="concat('.text-', 1+count(preceding-sibling::text()), '-')"/>
   </xsl:template>
   <xsl:template match="comment()" mode="generate-id-from-path">
      <xsl:apply-templates select="parent::*" mode="generate-id-from-path"/>
      <xsl:value-of select="concat('.comment-', 1+count(preceding-sibling::comment()), '-')"/>
   </xsl:template>
   <xsl:template match="processing-instruction()" mode="generate-id-from-path">
      <xsl:apply-templates select="parent::*" mode="generate-id-from-path"/>
      <xsl:value-of select="concat('.processing-instruction-', 1+count(preceding-sibling::processing-instruction()), '-')"/>
   </xsl:template>
   <xsl:template match="@*" mode="generate-id-from-path">
      <xsl:apply-templates select="parent::*" mode="generate-id-from-path"/>
      <xsl:value-of select="concat('.@', name())"/>
   </xsl:template>
   <xsl:template match="*" mode="generate-id-from-path" priority="-0.5">
      <xsl:apply-templates select="parent::*" mode="generate-id-from-path"/>
      <xsl:text>.</xsl:text>
      <xsl:value-of select="concat('.',name(),'-',1+count(preceding-sibling::*[name()=name(current())]),'-')"/>
   </xsl:template>

   <!--MODE: GENERATE-ID-2 -->
   <xsl:template match="/" mode="generate-id-2">U</xsl:template>
   <xsl:template match="*" mode="generate-id-2" priority="2">
      <xsl:text>U</xsl:text>
      <xsl:number level="multiple" count="*"/>
   </xsl:template>
   <xsl:template match="node()" mode="generate-id-2">
      <xsl:text>U.</xsl:text>
      <xsl:number level="multiple" count="*"/>
      <xsl:text>n</xsl:text>
      <xsl:number count="node()"/>
   </xsl:template>
   <xsl:template match="@*" mode="generate-id-2">
      <xsl:text>U.</xsl:text>
      <xsl:number level="multiple" count="*"/>
      <xsl:text>_</xsl:text>
      <xsl:value-of select="string-length(local-name(.))"/>
      <xsl:text>_</xsl:text>
      <xsl:value-of select="translate(name(),':','.')"/>
   </xsl:template>
   <!--Strip characters-->
   <xsl:template match="text()" priority="-1"/>

   <!--SCHEMA SETUP-->
   <xsl:template match="/">
      <svrl:schematron-output xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                              title="OPENPEPPOL CORE T76 bound to UBL"
                              schemaVersion="iso">
         <xsl:comment>
            <xsl:value-of select="$archiveDirParameter"/>
            <xsl:value-of select="$archiveNameParameter"/>
            <xsl:value-of select="$fileNameParameter"/>
            <xsl:value-of select="$fileDirParameter"/>
         </xsl:comment>
         <svrl:ns-prefix-in-attribute-values uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
                                             prefix="cac"/>
         <svrl:ns-prefix-in-attribute-values uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
                                             prefix="cbc"/>
         <svrl:ns-prefix-in-attribute-values uri="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
                                             prefix="ext"/>
         <svrl:ns-prefix-in-attribute-values uri="urn:oasis:names:specification:ubl:schema:xsd:OrderResponse-2"
                                             prefix="p1"/>
         <svrl:ns-prefix-in-attribute-values uri="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDataTypes-2"
                                             prefix="qdt"/>
         <svrl:ns-prefix-in-attribute-values uri="urn:oasis:names:specification:ubl:schema:xsd:UnqualifiedDataTypes-2"
                                             prefix="udt"/>
         <svrl:ns-prefix-in-attribute-values uri="urn:un:unece:uncefact:data:specification:CoreComponentTypeSchemaModule:2"
                                             prefix="ccts-cct"/>
         <svrl:ns-prefix-in-attribute-values uri="urn:un:unece:uncefact:documentation:2" prefix="ccts"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M9"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M10"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M11"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M12"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M13"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M14"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M15"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M16"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M17"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M18"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M19"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M20"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M21"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M22"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M23"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M24"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M25"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M26"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M27"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M28"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M29"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M30"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M31"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M32"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M33"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M34"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M35"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M36"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M37"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M38"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M39"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M40"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M41"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M42"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M43"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M44"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M45"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M46"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M47"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M48"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M49"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M50"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M51"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M52"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M53"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M54"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M55"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M56"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M57"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M58"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M59"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M60"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M61"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M62"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M63"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M64"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M65"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M66"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M67"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M68"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M69"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M70"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M71"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M72"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M73"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M74"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M75"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M76"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M77"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M78"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M79"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M80"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M81"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M82"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M83"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M84"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M85"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M86"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M87"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M88"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M89"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M90"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M91"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M92"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M93"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M94"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M95"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M96"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M97"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M98"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M99"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M100"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M101"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M102"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M103"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M104"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M105"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M106"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M107"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M108"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M109"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M110"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M111"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M112"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M113"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M114"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M115"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M116"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M117"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M118"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M119"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M120"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M121"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M122"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M123"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M124"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M125"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M126"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M127"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M128"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M129"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M130"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M131"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M132"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M133"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M134"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M135"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M136"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M137"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M138"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M139"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M140"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M141"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M142"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M143"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M144"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M145"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M146"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M147"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M148"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M149"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M150"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M151"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M152"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M153"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M154"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M155"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M156"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M157"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M158"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M159"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M160"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M161"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M162"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M163"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M164"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M165"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M166"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M167"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M168"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M169"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M170"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M171"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M172"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M173"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M174"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M175"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M176"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M177"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M178"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M179"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M180"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M181"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M182"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M183"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M184"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M185"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M186"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M187"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M188"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M189"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M190"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M191"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M192"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M193"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M194"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M195"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M196"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M197"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M198"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M199"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M200"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M201"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M202"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M203"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M204"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M205"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M206"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M207"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M208"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M209"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M210"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M211"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M212"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M213"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M214"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M215"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M216"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M217"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M218"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M219"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M220"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M221"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M222"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M223"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M224"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M225"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M226"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M227"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M228"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M229"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M230"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M231"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M232"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M233"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M234"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M235"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M236"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M237"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M238"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M239"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M240"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M241"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M242"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M243"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M244"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M245"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M246"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M247"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M248"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M249"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M250"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M251"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M252"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M253"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M254"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M255"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M256"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M257"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M258"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M259"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M260"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M261"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M262"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M263"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M264"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M265"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M266"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M267"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M268"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M269"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M270"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M271"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M272"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M273"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M274"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M275"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M276"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M277"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M278"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M279"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M280"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M281"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M282"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M283"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M284"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M285"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M286"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M287"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M288"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M289"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M290"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M291"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M292"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M293"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M294"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M295"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M296"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M297"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M298"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M299"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M300"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M301"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M302"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M303"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M304"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M305"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M306"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M307"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M308"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M309"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M310"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M311"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M312"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M313"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M314"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M315"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M316"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M317"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M318"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M319"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M320"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M321"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M322"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M323"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M324"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M325"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M326"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M327"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M328"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M329"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M330"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M331"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M332"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M333"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M334"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M335"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M336"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M337"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M338"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M339"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M340"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M341"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M342"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M343"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M344"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M345"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M346"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M347"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M348"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M349"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M350"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M351"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M352"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M353"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M354"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M355"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M356"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M357"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M358"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M359"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M360"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M361"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M362"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M363"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M364"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M365"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M366"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M367"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M368"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M369"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M370"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M371"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M372"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M373"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M374"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M375"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M376"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M377"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M378"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M379"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M380"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M381"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M382"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M383"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M384"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M385"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M386"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M387"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M388"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M389"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M390"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M391"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M392"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M393"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M394"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M395"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M396"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M397"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M398"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M399"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M400"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M401"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M402"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M403"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M404"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M405"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M406"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M407"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M408"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M409"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M410"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M411"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M412"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M413"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M414"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M415"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M416"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M417"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M418"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M419"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M420"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M421"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M422"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M423"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M424"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M425"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M426"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M427"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M428"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M429"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M430"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M431"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M432"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M433"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M434"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M435"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M436"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M437"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M438"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M439"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M440"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M441"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M442"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M443"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M444"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M445"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M446"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M447"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M448"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M449"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M450"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M451"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M452"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M453"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M454"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M455"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M456"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M457"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M458"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M459"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M460"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M461"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M462"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M463"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M464"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M465"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M466"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M467"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M468"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M469"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M470"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M471"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M472"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M473"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M474"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M475"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M476"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M477"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M478"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M479"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M480"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M481"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M482"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M483"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M484"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M485"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M486"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M487"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M488"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M489"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M490"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M491"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M492"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M493"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M494"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M495"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M496"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M497"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M498"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M499"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M500"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M501"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M502"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M503"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M504"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M505"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M506"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M507"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M508"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M509"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M510"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M511"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M512"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M513"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M514"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M515"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M516"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M517"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M518"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M519"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M520"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M521"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M522"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M523"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M524"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M525"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M526"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M527"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M528"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M529"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M530"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M531"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M532"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M533"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M534"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M535"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M536"/>
         <svrl:active-pattern>
            <xsl:attribute name="document">
               <xsl:value-of select="document-uri(/)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M537"/>
      </svrl:schematron-output>
   </xsl:template>

   <!--SCHEMATRON PATTERNS-->
   <svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">OPENPEPPOL CORE T76 bound to UBL</svrl:text>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse" priority="1000" mode="M9">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" context="/p1:OrderResponse"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="count(cbc:UBLVersionID)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                test="count(cbc:UBLVersionID)=1">
               <xsl:attribute name="id">PEPPOL_CORE_R001</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:UBLVersionID' must occur exactly 1 times.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="count(cbc:CustomizationID)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                test="count(cbc:CustomizationID)=1">
               <xsl:attribute name="id">PEPPOL_CORE_R001</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:CustomizationID' must occur exactly 1 times.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="count(cbc:ProfileID)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="count(cbc:ProfileID)=1">
               <xsl:attribute name="id">PEPPOL_CORE_R001</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:ProfileID' must occur exactly 1 times.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="count(cbc:OrderResponseCode)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                test="count(cbc:OrderResponseCode)=1">
               <xsl:attribute name="id">PEPPOL_CORE_R001</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:OrderResponseCode' must occur exactly 1 times.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="count(cbc:Note)&lt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="count(cbc:Note)&lt;=1">
               <xsl:attribute name="id">PEPPOL_CORE_R001</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:Note' may occur at maximum 1 times.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="count(cbc:DocumentCurrencyCode)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                test="count(cbc:DocumentCurrencyCode)=1">
               <xsl:attribute name="id">PEPPOL_CORE_R001</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:DocumentCurrencyCode' must occur exactly 1 times.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="count(cac:OrderReference)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                test="count(cac:OrderReference)=1">
               <xsl:attribute name="id">PEPPOL_CORE_R001</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:OrderReference' must occur exactly 1 times.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="count(cac:Delivery)&lt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="count(cac:Delivery)&lt;=1">
               <xsl:attribute name="id">PEPPOL_CORE_R001</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:Delivery' may occur at maximum 1 times.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M9"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M9"/>
   <xsl:template match="@*|node()" priority="-2" mode="M9">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M9"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:AccountingCustomerParty"
                 priority="1000"
                 mode="M10">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:AccountingCustomerParty"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:AccountingCustomerParty' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M10"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M10"/>
   <xsl:template match="@*|node()" priority="-2" mode="M10">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M10"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:AccountingSupplierParty"
                 priority="1000"
                 mode="M11">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:AccountingSupplierParty"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:AccountingSupplierParty' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M11"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M11"/>
   <xsl:template match="@*|node()" priority="-2" mode="M11">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M11"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:AdditionalDocumentReference"
                 priority="1000"
                 mode="M12">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:AdditionalDocumentReference"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:AdditionalDocumentReference' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M12"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M12"/>
   <xsl:template match="@*|node()" priority="-2" mode="M12">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M12"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:AllowanceCharge"
                 priority="1000"
                 mode="M13">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:AllowanceCharge"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:AllowanceCharge' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M13"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M13"/>
   <xsl:template match="@*|node()" priority="-2" mode="M13">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M13"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cac:AccountingContact"
                 priority="1000"
                 mode="M14">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:AccountingContact"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:AccountingContact' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M14"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M14"/>
   <xsl:template match="@*|node()" priority="-2" mode="M14">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M14"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cac:BuyerContact"
                 priority="1000"
                 mode="M15">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:BuyerContact"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:BuyerContact' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M15"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M15"/>
   <xsl:template match="@*|node()" priority="-2" mode="M15">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M15"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cac:DeliveryContact"
                 priority="1000"
                 mode="M16">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:DeliveryContact"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:DeliveryContact' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M16"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M16"/>
   <xsl:template match="@*|node()" priority="-2" mode="M16">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M16"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party"
                 priority="1000"
                 mode="M17">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="count(cac:PartyName)&lt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="count(cac:PartyName)&lt;=1">
               <xsl:attribute name="id">PEPPOL_CORE_R001</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:PartyName' may occur at maximum 1 times.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M17"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M17"/>
   <xsl:template match="@*|node()" priority="-2" mode="M17">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M17"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:AgentParty"
                 priority="1000"
                 mode="M18">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:AgentParty"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:AgentParty' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M18"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M18"/>
   <xsl:template match="@*|node()" priority="-2" mode="M18">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M18"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cac:OtherCommunication"
                 priority="1000"
                 mode="M19">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cac:OtherCommunication"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:OtherCommunication' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M19"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M19"/>
   <xsl:template match="@*|node()" priority="-2" mode="M19">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M19"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ElectronicMail"
                 priority="1000"
                 mode="M20">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ElectronicMail"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:ElectronicMail' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M20"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M20"/>
   <xsl:template match="@*|node()" priority="-2" mode="M20">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M20"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeAgencyID]"
                 priority="1000"
                 mode="M21">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeAgencyID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeAgencyID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M21"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M21"/>
   <xsl:template match="@*|node()" priority="-2" mode="M21">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M21"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeAgencyName]"
                 priority="1000"
                 mode="M22">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeAgencyName]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeAgencyName' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M22"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M22"/>
   <xsl:template match="@*|node()" priority="-2" mode="M22">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M22"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeDataURI]"
                 priority="1000"
                 mode="M23">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeDataURI]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeDataURI' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M23"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M23"/>
   <xsl:template match="@*|node()" priority="-2" mode="M23">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M23"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeID]"
                 priority="1000"
                 mode="M24">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M24"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M24"/>
   <xsl:template match="@*|node()" priority="-2" mode="M24">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M24"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeName]"
                 priority="1000"
                 mode="M25">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeName]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeName' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M25"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M25"/>
   <xsl:template match="@*|node()" priority="-2" mode="M25">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M25"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeURI]"
                 priority="1000"
                 mode="M26">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeURI]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeURI' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M26"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M26"/>
   <xsl:template match="@*|node()" priority="-2" mode="M26">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M26"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeVersionID]"
                 priority="1000"
                 mode="M27">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ID[@schemeVersionID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeVersionID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M27"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M27"/>
   <xsl:template match="@*|node()" priority="-2" mode="M27">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M27"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Name"
                 priority="1000"
                 mode="M28">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Name"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:Name' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M28"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M28"/>
   <xsl:template match="@*|node()" priority="-2" mode="M28">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M28"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Note"
                 priority="1000"
                 mode="M29">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Note"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:Note' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M29"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M29"/>
   <xsl:template match="@*|node()" priority="-2" mode="M29">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M29"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Telefax"
                 priority="1000"
                 mode="M30">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Telefax"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:Telefax' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M30"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M30"/>
   <xsl:template match="@*|node()" priority="-2" mode="M30">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M30"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Telephone"
                 priority="1000"
                 mode="M31">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Telephone"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:Telephone' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M31"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M31"/>
   <xsl:template match="@*|node()" priority="-2" mode="M31">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M31"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:FinancialAccount"
                 priority="1000"
                 mode="M32">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:FinancialAccount"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:FinancialAccount' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M32"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M32"/>
   <xsl:template match="@*|node()" priority="-2" mode="M32">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M32"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Language"
                 priority="1000"
                 mode="M33">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Language"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:Language' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M33"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M33"/>
   <xsl:template match="@*|node()" priority="-2" mode="M33">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M33"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"
                 priority="1000"
                 mode="M34">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="@schemeID"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="@schemeID">
               <xsl:attribute name="id">PEPPOL_CORE_R001</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute '@schemeID' is required in this context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M34"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M34"/>
   <xsl:template match="@*|node()" priority="-2" mode="M34">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M34"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeAgencyID]"
                 priority="1000"
                 mode="M35">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeAgencyID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeAgencyID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M35"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M35"/>
   <xsl:template match="@*|node()" priority="-2" mode="M35">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M35"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeAgencyName]"
                 priority="1000"
                 mode="M36">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeAgencyName]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeAgencyName' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M36"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M36"/>
   <xsl:template match="@*|node()" priority="-2" mode="M36">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M36"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeDataURI]"
                 priority="1000"
                 mode="M37">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeDataURI]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeDataURI' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M37"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M37"/>
   <xsl:template match="@*|node()" priority="-2" mode="M37">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M37"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeName]"
                 priority="1000"
                 mode="M38">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeName]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeName' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M38"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M38"/>
   <xsl:template match="@*|node()" priority="-2" mode="M38">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M38"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeURI]"
                 priority="1000"
                 mode="M39">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeURI]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeURI' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M39"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M39"/>
   <xsl:template match="@*|node()" priority="-2" mode="M39">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M39"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeVersionID]"
                 priority="1000"
                 mode="M40">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeVersionID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeVersionID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M40"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M40"/>
   <xsl:template match="@*|node()" priority="-2" mode="M40">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M40"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity"
                 priority="1000"
                 mode="M41">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:PartyLegalEntity' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M41"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M41"/>
   <xsl:template match="@*|node()" priority="-2" mode="M41">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M41"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyName/cbc:Name[@languageID]"
                 priority="1000"
                 mode="M42">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyName/cbc:Name[@languageID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @languageID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M42"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M42"/>
   <xsl:template match="@*|node()" priority="-2" mode="M42">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M42"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyName/cbc:Name[@languageLocaleID]"
                 priority="1000"
                 mode="M43">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyName/cbc:Name[@languageLocaleID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @languageLocaleID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M43"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M43"/>
   <xsl:template match="@*|node()" priority="-2" mode="M43">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M43"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme"
                 priority="1000"
                 mode="M44">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:PartyTaxScheme' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M44"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M44"/>
   <xsl:template match="@*|node()" priority="-2" mode="M44">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M44"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Person"
                 priority="1000"
                 mode="M45">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:Person"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:Person' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M45"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M45"/>
   <xsl:template match="@*|node()" priority="-2" mode="M45">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M45"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation"
                 priority="1000"
                 mode="M46">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M46"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M46"/>
   <xsl:template match="@*|node()" priority="-2" mode="M46">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M46"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress"
                 priority="1000"
                 mode="M47">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:PostalAddress' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M47"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M47"/>
   <xsl:template match="@*|node()" priority="-2" mode="M47">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M47"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PowerOfAttorney"
                 priority="1000"
                 mode="M48">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PowerOfAttorney"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M48"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M48"/>
   <xsl:template match="@*|node()" priority="-2" mode="M48">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M48"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:ServiceProviderParty"
                 priority="1000"
                 mode="M49">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:ServiceProviderParty"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M49"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M49"/>
   <xsl:template match="@*|node()" priority="-2" mode="M49">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M49"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:EndpointID"
                 priority="1000"
                 mode="M50">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:EndpointID"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="@schemeID"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="@schemeID">
               <xsl:attribute name="id">PEPPOL_CORE_R001</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute '@schemeID' is required in this context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M50"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M50"/>
   <xsl:template match="@*|node()" priority="-2" mode="M50">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M50"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:EndpointID[@schemeAgencyID]"
                 priority="1000"
                 mode="M51">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:EndpointID[@schemeAgencyID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeAgencyID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M51"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M51"/>
   <xsl:template match="@*|node()" priority="-2" mode="M51">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M51"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:EndpointID[@schemeAgencyName]"
                 priority="1000"
                 mode="M52">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:EndpointID[@schemeAgencyName]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeAgencyName' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M52"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M52"/>
   <xsl:template match="@*|node()" priority="-2" mode="M52">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M52"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:EndpointID[@schemeDataURI]"
                 priority="1000"
                 mode="M53">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:EndpointID[@schemeDataURI]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeDataURI' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M53"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M53"/>
   <xsl:template match="@*|node()" priority="-2" mode="M53">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M53"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:EndpointID[@schemeName]"
                 priority="1000"
                 mode="M54">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:EndpointID[@schemeName]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeName' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M54"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M54"/>
   <xsl:template match="@*|node()" priority="-2" mode="M54">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M54"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:EndpointID[@schemeURI]"
                 priority="1000"
                 mode="M55">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:EndpointID[@schemeURI]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeURI' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M55"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M55"/>
   <xsl:template match="@*|node()" priority="-2" mode="M55">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M55"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:EndpointID[@schemeVersionID]"
                 priority="1000"
                 mode="M56">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:EndpointID[@schemeVersionID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeVersionID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M56"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M56"/>
   <xsl:template match="@*|node()" priority="-2" mode="M56">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M56"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:IndustryClassificationCode"
                 priority="1000"
                 mode="M57">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:IndustryClassificationCode"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M57"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M57"/>
   <xsl:template match="@*|node()" priority="-2" mode="M57">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M57"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:LogoReferenceID"
                 priority="1000"
                 mode="M58">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:LogoReferenceID"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M58"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M58"/>
   <xsl:template match="@*|node()" priority="-2" mode="M58">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M58"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:MarkAttentionIndicator"
                 priority="1000"
                 mode="M59">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:MarkAttentionIndicator"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M59"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M59"/>
   <xsl:template match="@*|node()" priority="-2" mode="M59">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M59"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:MarkCareIndicator"
                 priority="1000"
                 mode="M60">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:MarkCareIndicator"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M60"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M60"/>
   <xsl:template match="@*|node()" priority="-2" mode="M60">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M60"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:WebsiteURI"
                 priority="1000"
                 mode="M61">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:WebsiteURI"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M61"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M61"/>
   <xsl:template match="@*|node()" priority="-2" mode="M61">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M61"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cbc:AdditionalAccountID"
                 priority="1000"
                 mode="M62">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cbc:AdditionalAccountID"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:AdditionalAccountID' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M62"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M62"/>
   <xsl:template match="@*|node()" priority="-2" mode="M62">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M62"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cbc:CustomerAssignedAccountID"
                 priority="1000"
                 mode="M63">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cbc:CustomerAssignedAccountID"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:CustomerAssignedAccountID' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M63"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M63"/>
   <xsl:template match="@*|node()" priority="-2" mode="M63">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M63"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:BuyerCustomerParty/cbc:SupplierAssignedAccountID"
                 priority="1000"
                 mode="M64">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:BuyerCustomerParty/cbc:SupplierAssignedAccountID"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:SupplierAssignedAccountID' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M64"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M64"/>
   <xsl:template match="@*|node()" priority="-2" mode="M64">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M64"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:Contract" priority="1000" mode="M65">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:Contract"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:Contract' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M65"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M65"/>
   <xsl:template match="@*|node()" priority="-2" mode="M65">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M65"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:Delivery" priority="1000" mode="M66">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:Delivery"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="count(cac:PromisedDeliveryPeriod)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                test="count(cac:PromisedDeliveryPeriod)=1">
               <xsl:attribute name="id">PEPPOL_CORE_R001</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:PromisedDeliveryPeriod' must occur exactly 1 times.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M66"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M66"/>
   <xsl:template match="@*|node()" priority="-2" mode="M66">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M66"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:Delivery/cac:AlternativeDeliveryLocation"
                 priority="1000"
                 mode="M67">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:Delivery/cac:AlternativeDeliveryLocation"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:AlternativeDeliveryLocation' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M67"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M67"/>
   <xsl:template match="@*|node()" priority="-2" mode="M67">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M67"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:Delivery/cac:CarrierParty"
                 priority="1000"
                 mode="M68">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:Delivery/cac:CarrierParty"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:CarrierParty' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M68"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M68"/>
   <xsl:template match="@*|node()" priority="-2" mode="M68">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M68"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:Delivery/cac:DeliveryAddress"
                 priority="1000"
                 mode="M69">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:Delivery/cac:DeliveryAddress"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:DeliveryAddress' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M69"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M69"/>
   <xsl:template match="@*|node()" priority="-2" mode="M69">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M69"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:Delivery/cac:DeliveryLocation"
                 priority="1000"
                 mode="M70">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:Delivery/cac:DeliveryLocation"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:DeliveryLocation' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M70"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M70"/>
   <xsl:template match="@*|node()" priority="-2" mode="M70">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M70"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:Delivery/cac:DeliveryParty"
                 priority="1000"
                 mode="M71">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:Delivery/cac:DeliveryParty"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:DeliveryParty' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M71"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M71"/>
   <xsl:template match="@*|node()" priority="-2" mode="M71">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M71"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:Delivery/cac:DeliveryTerms"
                 priority="1000"
                 mode="M72">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:Delivery/cac:DeliveryTerms"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:DeliveryTerms' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M72"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M72"/>
   <xsl:template match="@*|node()" priority="-2" mode="M72">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M72"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:Delivery/cac:Despatch"
                 priority="1000"
                 mode="M73">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:Delivery/cac:Despatch"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:Despatch' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M73"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M73"/>
   <xsl:template match="@*|node()" priority="-2" mode="M73">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M73"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:Delivery/cac:EstimatedDeliveryPeriod"
                 priority="1000"
                 mode="M74">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:Delivery/cac:EstimatedDeliveryPeriod"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:EstimatedDeliveryPeriod' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M74"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M74"/>
   <xsl:template match="@*|node()" priority="-2" mode="M74">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M74"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:Delivery/cac:MaximumDeliveryUnit"
                 priority="1000"
                 mode="M75">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:Delivery/cac:MaximumDeliveryUnit"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:MaximumDeliveryUnit' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M75"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M75"/>
   <xsl:template match="@*|node()" priority="-2" mode="M75">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M75"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:Delivery/cac:MinimumDeliveryUnit"
                 priority="1000"
                 mode="M76">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:Delivery/cac:MinimumDeliveryUnit"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:MinimumDeliveryUnit' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M76"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M76"/>
   <xsl:template match="@*|node()" priority="-2" mode="M76">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M76"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:Delivery/cac:NotifyParty"
                 priority="1000"
                 mode="M77">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:Delivery/cac:NotifyParty"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:NotifyParty' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M77"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M77"/>
   <xsl:template match="@*|node()" priority="-2" mode="M77">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M77"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:Description"
                 priority="1000"
                 mode="M78">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:Description"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:Description' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M78"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M78"/>
   <xsl:template match="@*|node()" priority="-2" mode="M78">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M78"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:DescriptionCode"
                 priority="1000"
                 mode="M79">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:DescriptionCode"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:DescriptionCode' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M79"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M79"/>
   <xsl:template match="@*|node()" priority="-2" mode="M79">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M79"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:DurationMeasure"
                 priority="1000"
                 mode="M80">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:DurationMeasure"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:DurationMeasure' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M80"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M80"/>
   <xsl:template match="@*|node()" priority="-2" mode="M80">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M80"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:EndTime"
                 priority="1000"
                 mode="M81">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:EndTime"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:EndTime' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M81"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M81"/>
   <xsl:template match="@*|node()" priority="-2" mode="M81">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M81"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:StartTime"
                 priority="1000"
                 mode="M82">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:StartTime"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:StartTime' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M82"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M82"/>
   <xsl:template match="@*|node()" priority="-2" mode="M82">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M82"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:Delivery/cac:RequestedDeliveryPeriod"
                 priority="1000"
                 mode="M83">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:Delivery/cac:RequestedDeliveryPeriod"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:RequestedDeliveryPeriod' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M83"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M83"/>
   <xsl:template match="@*|node()" priority="-2" mode="M83">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M83"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:Delivery/cac:Shipment"
                 priority="1000"
                 mode="M84">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:Delivery/cac:Shipment"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:Shipment' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M84"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M84"/>
   <xsl:template match="@*|node()" priority="-2" mode="M84">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M84"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:Delivery/cbc:ActualDeliveryDate"
                 priority="1000"
                 mode="M85">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:Delivery/cbc:ActualDeliveryDate"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:ActualDeliveryDate' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M85"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M85"/>
   <xsl:template match="@*|node()" priority="-2" mode="M85">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M85"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:Delivery/cbc:ActualDeliveryTime"
                 priority="1000"
                 mode="M86">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:Delivery/cbc:ActualDeliveryTime"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:ActualDeliveryTime' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M86"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M86"/>
   <xsl:template match="@*|node()" priority="-2" mode="M86">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M86"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:Delivery/cbc:ID"
                 priority="1000"
                 mode="M87">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:Delivery/cbc:ID"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:ID' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M87"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M87"/>
   <xsl:template match="@*|node()" priority="-2" mode="M87">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M87"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:Delivery/cbc:LatestDeliveryDate"
                 priority="1000"
                 mode="M88">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:Delivery/cbc:LatestDeliveryDate"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:LatestDeliveryDate' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M88"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M88"/>
   <xsl:template match="@*|node()" priority="-2" mode="M88">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M88"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:Delivery/cbc:LatestDeliveryTime"
                 priority="1000"
                 mode="M89">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:Delivery/cbc:LatestDeliveryTime"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:LatestDeliveryTime' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M89"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M89"/>
   <xsl:template match="@*|node()" priority="-2" mode="M89">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M89"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:Delivery/cbc:MaximumQuantity"
                 priority="1000"
                 mode="M90">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:Delivery/cbc:MaximumQuantity"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:MaximumQuantity' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M90"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M90"/>
   <xsl:template match="@*|node()" priority="-2" mode="M90">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M90"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:Delivery/cbc:MinimumQuantity"
                 priority="1000"
                 mode="M91">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:Delivery/cbc:MinimumQuantity"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:MinimumQuantity' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M91"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M91"/>
   <xsl:template match="@*|node()" priority="-2" mode="M91">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M91"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:Delivery/cbc:Quantity"
                 priority="1000"
                 mode="M92">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:Delivery/cbc:Quantity"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:Quantity' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M92"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M92"/>
   <xsl:template match="@*|node()" priority="-2" mode="M92">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M92"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:Delivery/cbc:ReleaseID"
                 priority="1000"
                 mode="M93">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:Delivery/cbc:ReleaseID"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:ReleaseID' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M93"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M93"/>
   <xsl:template match="@*|node()" priority="-2" mode="M93">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M93"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:Delivery/cbc:TrackingID"
                 priority="1000"
                 mode="M94">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:Delivery/cbc:TrackingID"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:TrackingID' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M94"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M94"/>
   <xsl:template match="@*|node()" priority="-2" mode="M94">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M94"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:DeliveryTerms"
                 priority="1000"
                 mode="M95">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:DeliveryTerms"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:DeliveryTerms' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M95"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M95"/>
   <xsl:template match="@*|node()" priority="-2" mode="M95">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M95"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:DestinationCountry"
                 priority="1000"
                 mode="M96">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:DestinationCountry"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:DestinationCountry' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M96"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M96"/>
   <xsl:template match="@*|node()" priority="-2" mode="M96">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M96"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:FreightForwarderParty"
                 priority="1000"
                 mode="M97">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:FreightForwarderParty"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:FreightForwarderParty' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M97"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M97"/>
   <xsl:template match="@*|node()" priority="-2" mode="M97">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M97"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:LegalMonetaryTotal"
                 priority="1000"
                 mode="M98">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:LegalMonetaryTotal"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:LegalMonetaryTotal' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M98"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M98"/>
   <xsl:template match="@*|node()" priority="-2" mode="M98">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M98"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderDocumentReference"
                 priority="1000"
                 mode="M99">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderDocumentReference"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:OrderDocumentReference' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M99"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M99"/>
   <xsl:template match="@*|node()" priority="-2" mode="M99">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M99"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine" priority="1000" mode="M100">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="count(cac:SellerSubstitutedLineItem)&lt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                test="count(cac:SellerSubstitutedLineItem)&lt;=1">
               <xsl:attribute name="id">PEPPOL_CORE_R001</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:SellerSubstitutedLineItem' may occur at maximum 1 times.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="count(cac:OrderLineReference)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                test="count(cac:OrderLineReference)=1">
               <xsl:attribute name="id">PEPPOL_CORE_R001</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:OrderLineReference' must occur exactly 1 times.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M100"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M100"/>
   <xsl:template match="@*|node()" priority="-2" mode="M100">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M100"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:BuyerProposedSubstituteLineItem"
                 priority="1000"
                 mode="M101">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:BuyerProposedSubstituteLineItem"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:BuyerProposedSubstituteLineItem' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M101"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M101"/>
   <xsl:template match="@*|node()" priority="-2" mode="M101">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M101"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:CatalogueLineReference"
                 priority="1000"
                 mode="M102">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:CatalogueLineReference"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:CatalogueLineReference' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M102"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M102"/>
   <xsl:template match="@*|node()" priority="-2" mode="M102">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M102"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:DocumentReference"
                 priority="1000"
                 mode="M103">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:DocumentReference"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:DocumentReference' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M103"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M103"/>
   <xsl:template match="@*|node()" priority="-2" mode="M103">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M103"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem"
                 priority="1000"
                 mode="M104">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="count(cbc:Note)&lt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="count(cbc:Note)&lt;=1">
               <xsl:attribute name="id">PEPPOL_CORE_R001</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:Note' may occur at maximum 1 times.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="count(cbc:LineStatusCode)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                test="count(cbc:LineStatusCode)=1">
               <xsl:attribute name="id">PEPPOL_CORE_R001</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:LineStatusCode' must occur exactly 1 times.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="count(cac:Delivery)&lt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="count(cac:Delivery)&lt;=1">
               <xsl:attribute name="id">PEPPOL_CORE_R001</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:Delivery' may occur at maximum 1 times.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M104"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M104"/>
   <xsl:template match="@*|node()" priority="-2" mode="M104">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M104"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:AllowanceCharge"
                 priority="1000"
                 mode="M105">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:AllowanceCharge"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:AllowanceCharge' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M105"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M105"/>
   <xsl:template match="@*|node()" priority="-2" mode="M105">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M105"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery"
                 priority="1000"
                 mode="M106">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="count(cac:PromisedDeliveryPeriod)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                test="count(cac:PromisedDeliveryPeriod)=1">
               <xsl:attribute name="id">PEPPOL_CORE_R001</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:PromisedDeliveryPeriod' must occur exactly 1 times.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M106"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M106"/>
   <xsl:template match="@*|node()" priority="-2" mode="M106">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M106"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:AlternativeDeliveryLocation"
                 priority="1000"
                 mode="M107">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:AlternativeDeliveryLocation"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:AlternativeDeliveryLocation' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M107"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M107"/>
   <xsl:template match="@*|node()" priority="-2" mode="M107">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M107"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:CarrierParty"
                 priority="1000"
                 mode="M108">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:CarrierParty"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:CarrierParty' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M108"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M108"/>
   <xsl:template match="@*|node()" priority="-2" mode="M108">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M108"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:DeliveryAddress"
                 priority="1000"
                 mode="M109">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:DeliveryAddress"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:DeliveryAddress' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M109"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M109"/>
   <xsl:template match="@*|node()" priority="-2" mode="M109">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M109"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:DeliveryLocation"
                 priority="1000"
                 mode="M110">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:DeliveryLocation"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:DeliveryLocation' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M110"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M110"/>
   <xsl:template match="@*|node()" priority="-2" mode="M110">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M110"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:DeliveryParty"
                 priority="1000"
                 mode="M111">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:DeliveryParty"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:DeliveryParty' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M111"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M111"/>
   <xsl:template match="@*|node()" priority="-2" mode="M111">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M111"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:DeliveryTerms"
                 priority="1000"
                 mode="M112">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:DeliveryTerms"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:DeliveryTerms' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M112"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M112"/>
   <xsl:template match="@*|node()" priority="-2" mode="M112">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M112"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:Despatch"
                 priority="1000"
                 mode="M113">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:Despatch"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:Despatch' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M113"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M113"/>
   <xsl:template match="@*|node()" priority="-2" mode="M113">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M113"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:EstimatedDeliveryPeriod"
                 priority="1000"
                 mode="M114">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:EstimatedDeliveryPeriod"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:EstimatedDeliveryPeriod' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M114"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M114"/>
   <xsl:template match="@*|node()" priority="-2" mode="M114">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M114"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:MaximumDeliveryUnit"
                 priority="1000"
                 mode="M115">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:MaximumDeliveryUnit"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:MaximumDeliveryUnit' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M115"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M115"/>
   <xsl:template match="@*|node()" priority="-2" mode="M115">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M115"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:MinimumDeliveryUnit"
                 priority="1000"
                 mode="M116">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:MinimumDeliveryUnit"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:MinimumDeliveryUnit' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M116"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M116"/>
   <xsl:template match="@*|node()" priority="-2" mode="M116">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M116"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:NotifyParty"
                 priority="1000"
                 mode="M117">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:NotifyParty"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:NotifyParty' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M117"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M117"/>
   <xsl:template match="@*|node()" priority="-2" mode="M117">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M117"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:Description"
                 priority="1000"
                 mode="M118">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:Description"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:Description' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M118"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M118"/>
   <xsl:template match="@*|node()" priority="-2" mode="M118">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M118"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:DescriptionCode"
                 priority="1000"
                 mode="M119">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:DescriptionCode"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:DescriptionCode' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M119"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M119"/>
   <xsl:template match="@*|node()" priority="-2" mode="M119">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M119"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:DurationMeasure"
                 priority="1000"
                 mode="M120">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:DurationMeasure"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:DurationMeasure' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M120"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M120"/>
   <xsl:template match="@*|node()" priority="-2" mode="M120">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M120"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:EndTime"
                 priority="1000"
                 mode="M121">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:EndTime"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:EndTime' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M121"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M121"/>
   <xsl:template match="@*|node()" priority="-2" mode="M121">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M121"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:StartTime"
                 priority="1000"
                 mode="M122">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:StartTime"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:StartTime' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M122"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M122"/>
   <xsl:template match="@*|node()" priority="-2" mode="M122">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M122"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:RequestedDeliveryPeriod"
                 priority="1000"
                 mode="M123">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:RequestedDeliveryPeriod"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:RequestedDeliveryPeriod' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M123"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M123"/>
   <xsl:template match="@*|node()" priority="-2" mode="M123">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M123"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:Shipment"
                 priority="1000"
                 mode="M124">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:Shipment"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:Shipment' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M124"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M124"/>
   <xsl:template match="@*|node()" priority="-2" mode="M124">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M124"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:ActualDeliveryDate"
                 priority="1000"
                 mode="M125">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:ActualDeliveryDate"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:ActualDeliveryDate' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M125"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M125"/>
   <xsl:template match="@*|node()" priority="-2" mode="M125">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M125"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:ActualDeliveryTime"
                 priority="1000"
                 mode="M126">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:ActualDeliveryTime"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:ActualDeliveryTime' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M126"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M126"/>
   <xsl:template match="@*|node()" priority="-2" mode="M126">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M126"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:ID"
                 priority="1000"
                 mode="M127">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:ID"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:ID' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M127"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M127"/>
   <xsl:template match="@*|node()" priority="-2" mode="M127">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M127"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:LatestDeliveryDate"
                 priority="1000"
                 mode="M128">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:LatestDeliveryDate"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:LatestDeliveryDate' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M128"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M128"/>
   <xsl:template match="@*|node()" priority="-2" mode="M128">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M128"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:LatestDeliveryTime"
                 priority="1000"
                 mode="M129">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:LatestDeliveryTime"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:LatestDeliveryTime' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M129"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M129"/>
   <xsl:template match="@*|node()" priority="-2" mode="M129">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M129"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:MaximumQuantity"
                 priority="1000"
                 mode="M130">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:MaximumQuantity"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:MaximumQuantity' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M130"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M130"/>
   <xsl:template match="@*|node()" priority="-2" mode="M130">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M130"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:MinimumQuantity"
                 priority="1000"
                 mode="M131">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:MinimumQuantity"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:MinimumQuantity' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M131"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M131"/>
   <xsl:template match="@*|node()" priority="-2" mode="M131">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M131"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:Quantity"
                 priority="1000"
                 mode="M132">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:Quantity"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:Quantity' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M132"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M132"/>
   <xsl:template match="@*|node()" priority="-2" mode="M132">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M132"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:ReleaseID"
                 priority="1000"
                 mode="M133">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:ReleaseID"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:ReleaseID' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M133"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M133"/>
   <xsl:template match="@*|node()" priority="-2" mode="M133">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M133"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:TrackingID"
                 priority="1000"
                 mode="M134">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:TrackingID"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:TrackingID' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M134"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M134"/>
   <xsl:template match="@*|node()" priority="-2" mode="M134">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M134"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:DeliveryTerms"
                 priority="1000"
                 mode="M135">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:DeliveryTerms"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:DeliveryTerms' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M135"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M135"/>
   <xsl:template match="@*|node()" priority="-2" mode="M135">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M135"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemIdentification"
                 priority="1000"
                 mode="M136">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemIdentification"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:AdditionalItemIdentification' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M136"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M136"/>
   <xsl:template match="@*|node()" priority="-2" mode="M136">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M136"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty"
                 priority="1000"
                 mode="M137">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:AdditionalItemProperty' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M137"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M137"/>
   <xsl:template match="@*|node()" priority="-2" mode="M137">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M137"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:BuyersItemIdentification"
                 priority="1000"
                 mode="M138">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:BuyersItemIdentification"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:BuyersItemIdentification' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M138"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M138"/>
   <xsl:template match="@*|node()" priority="-2" mode="M138">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M138"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:CatalogueDocumentReference"
                 priority="1000"
                 mode="M139">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:CatalogueDocumentReference"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:CatalogueDocumentReference' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M139"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M139"/>
   <xsl:template match="@*|node()" priority="-2" mode="M139">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M139"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:CatalogueItemIdentification"
                 priority="1000"
                 mode="M140">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:CatalogueItemIdentification"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:CatalogueItemIdentification' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M140"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M140"/>
   <xsl:template match="@*|node()" priority="-2" mode="M140">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M140"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:Certificate"
                 priority="1000"
                 mode="M141">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:Certificate"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:Certificate' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M141"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M141"/>
   <xsl:template match="@*|node()" priority="-2" mode="M141">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M141"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory"
                 priority="1000"
                 mode="M142">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:ClassifiedTaxCategory' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M142"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M142"/>
   <xsl:template match="@*|node()" priority="-2" mode="M142">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M142"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:CommodityClassification"
                 priority="1000"
                 mode="M143">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:CommodityClassification"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:CommodityClassification' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M143"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M143"/>
   <xsl:template match="@*|node()" priority="-2" mode="M143">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M143"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:Dimension"
                 priority="1000"
                 mode="M144">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:Dimension"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:Dimension' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M144"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M144"/>
   <xsl:template match="@*|node()" priority="-2" mode="M144">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M144"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:HazardousItem"
                 priority="1000"
                 mode="M145">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:HazardousItem"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:HazardousItem' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M145"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M145"/>
   <xsl:template match="@*|node()" priority="-2" mode="M145">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M145"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:InformationContentProviderParty"
                 priority="1000"
                 mode="M146">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:InformationContentProviderParty"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:InformationContentProviderParty' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M146"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M146"/>
   <xsl:template match="@*|node()" priority="-2" mode="M146">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M146"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemInstance"
                 priority="1000"
                 mode="M147">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemInstance"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:ItemInstance' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M147"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M147"/>
   <xsl:template match="@*|node()" priority="-2" mode="M147">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M147"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference"
                 priority="1000"
                 mode="M148">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:ItemSpecificationDocumentReference' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M148"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M148"/>
   <xsl:template match="@*|node()" priority="-2" mode="M148">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M148"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ManufacturerParty"
                 priority="1000"
                 mode="M149">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ManufacturerParty"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:ManufacturerParty' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M149"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M149"/>
   <xsl:template match="@*|node()" priority="-2" mode="M149">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M149"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ManufacturersItemIdentification"
                 priority="1000"
                 mode="M150">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ManufacturersItemIdentification"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:ManufacturersItemIdentification' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M150"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M150"/>
   <xsl:template match="@*|node()" priority="-2" mode="M150">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M150"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:OriginAddress"
                 priority="1000"
                 mode="M151">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:OriginAddress"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:OriginAddress' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M151"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M151"/>
   <xsl:template match="@*|node()" priority="-2" mode="M151">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M151"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:OriginCountry"
                 priority="1000"
                 mode="M152">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:OriginCountry"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:OriginCountry' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M152"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M152"/>
   <xsl:template match="@*|node()" priority="-2" mode="M152">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M152"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cac:IssuerParty"
                 priority="1000"
                 mode="M153">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cac:IssuerParty"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:IssuerParty' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M153"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M153"/>
   <xsl:template match="@*|node()" priority="-2" mode="M153">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M153"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cac:MeasurementDimension"
                 priority="1000"
                 mode="M154">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cac:MeasurementDimension"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:MeasurementDimension' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M154"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M154"/>
   <xsl:template match="@*|node()" priority="-2" mode="M154">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M154"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cac:PhysicalAttribute"
                 priority="1000"
                 mode="M155">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cac:PhysicalAttribute"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:PhysicalAttribute' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M155"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M155"/>
   <xsl:template match="@*|node()" priority="-2" mode="M155">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M155"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:BarcodeSymbologyID"
                 priority="1000"
                 mode="M156">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:BarcodeSymbologyID"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:BarcodeSymbologyID' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M156"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M156"/>
   <xsl:template match="@*|node()" priority="-2" mode="M156">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M156"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:ExtendedID"
                 priority="1000"
                 mode="M157">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:ExtendedID"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:ExtendedID' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M157"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M157"/>
   <xsl:template match="@*|node()" priority="-2" mode="M157">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M157"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeAgencyID]"
                 priority="1000"
                 mode="M158">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeAgencyID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeAgencyID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M158"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M158"/>
   <xsl:template match="@*|node()" priority="-2" mode="M158">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M158"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeAgencyName]"
                 priority="1000"
                 mode="M159">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeAgencyName]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeAgencyName' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M159"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M159"/>
   <xsl:template match="@*|node()" priority="-2" mode="M159">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M159"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeDataURI]"
                 priority="1000"
                 mode="M160">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeDataURI]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeDataURI' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M160"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M160"/>
   <xsl:template match="@*|node()" priority="-2" mode="M160">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M160"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeID]"
                 priority="1000"
                 mode="M161">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M161"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M161"/>
   <xsl:template match="@*|node()" priority="-2" mode="M161">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M161"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeName]"
                 priority="1000"
                 mode="M162">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeName]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeName' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M162"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M162"/>
   <xsl:template match="@*|node()" priority="-2" mode="M162">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M162"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeURI]"
                 priority="1000"
                 mode="M163">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeURI]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeURI' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M163"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M163"/>
   <xsl:template match="@*|node()" priority="-2" mode="M163">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M163"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeVersionID]"
                 priority="1000"
                 mode="M164">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeVersionID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeVersionID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M164"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M164"/>
   <xsl:template match="@*|node()" priority="-2" mode="M164">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M164"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cac:IssuerParty"
                 priority="1000"
                 mode="M165">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cac:IssuerParty"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:IssuerParty' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M165"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M165"/>
   <xsl:template match="@*|node()" priority="-2" mode="M165">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M165"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cac:MeasurementDimension"
                 priority="1000"
                 mode="M166">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cac:MeasurementDimension"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:MeasurementDimension' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M166"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M166"/>
   <xsl:template match="@*|node()" priority="-2" mode="M166">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M166"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cac:PhysicalAttribute"
                 priority="1000"
                 mode="M167">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cac:PhysicalAttribute"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:PhysicalAttribute' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M167"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M167"/>
   <xsl:template match="@*|node()" priority="-2" mode="M167">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M167"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:BarcodeSymbologyID"
                 priority="1000"
                 mode="M168">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:BarcodeSymbologyID"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:BarcodeSymbologyID' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M168"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M168"/>
   <xsl:template match="@*|node()" priority="-2" mode="M168">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M168"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:ExtendedID"
                 priority="1000"
                 mode="M169">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:ExtendedID"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:ExtendedID' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M169"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M169"/>
   <xsl:template match="@*|node()" priority="-2" mode="M169">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M169"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeAgencyID]"
                 priority="1000"
                 mode="M170">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeAgencyID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeAgencyID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M170"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M170"/>
   <xsl:template match="@*|node()" priority="-2" mode="M170">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M170"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeAgencyName]"
                 priority="1000"
                 mode="M171">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeAgencyName]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeAgencyName' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M171"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M171"/>
   <xsl:template match="@*|node()" priority="-2" mode="M171">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M171"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeDataURI]"
                 priority="1000"
                 mode="M172">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeDataURI]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeDataURI' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M172"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M172"/>
   <xsl:template match="@*|node()" priority="-2" mode="M172">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M172"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeName]"
                 priority="1000"
                 mode="M173">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeName]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeName' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M173"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M173"/>
   <xsl:template match="@*|node()" priority="-2" mode="M173">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M173"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeURI]"
                 priority="1000"
                 mode="M174">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeURI]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeURI' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M174"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M174"/>
   <xsl:template match="@*|node()" priority="-2" mode="M174">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M174"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeVersionID]"
                 priority="1000"
                 mode="M175">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeVersionID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeVersionID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M175"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M175"/>
   <xsl:template match="@*|node()" priority="-2" mode="M175">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M175"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:TransactionConditions"
                 priority="1000"
                 mode="M176">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:TransactionConditions"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:TransactionConditions' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M176"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M176"/>
   <xsl:template match="@*|node()" priority="-2" mode="M176">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M176"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:AdditionalInformation"
                 priority="1000"
                 mode="M177">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:AdditionalInformation"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:AdditionalInformation' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M177"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M177"/>
   <xsl:template match="@*|node()" priority="-2" mode="M177">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M177"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:BrandName"
                 priority="1000"
                 mode="M178">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:BrandName"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:BrandName' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M178"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M178"/>
   <xsl:template match="@*|node()" priority="-2" mode="M178">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M178"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:CatalogueIndicator"
                 priority="1000"
                 mode="M179">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:CatalogueIndicator"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:CatalogueIndicator' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M179"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M179"/>
   <xsl:template match="@*|node()" priority="-2" mode="M179">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M179"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:Description"
                 priority="1000"
                 mode="M180">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:Description"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:Description' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M180"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M180"/>
   <xsl:template match="@*|node()" priority="-2" mode="M180">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M180"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:HazardousRiskIndicator"
                 priority="1000"
                 mode="M181">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:HazardousRiskIndicator"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:HazardousRiskIndicator' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M181"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M181"/>
   <xsl:template match="@*|node()" priority="-2" mode="M181">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M181"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:Keyword"
                 priority="1000"
                 mode="M182">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:Keyword"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:Keyword' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M182"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M182"/>
   <xsl:template match="@*|node()" priority="-2" mode="M182">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M182"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:ModelName"
                 priority="1000"
                 mode="M183">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:ModelName"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:ModelName' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M183"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M183"/>
   <xsl:template match="@*|node()" priority="-2" mode="M183">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M183"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:Name[@languageID]"
                 priority="1000"
                 mode="M184">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:Name[@languageID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @languageID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M184"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M184"/>
   <xsl:template match="@*|node()" priority="-2" mode="M184">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M184"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:Name[@languageLocaleID]"
                 priority="1000"
                 mode="M185">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:Name[@languageLocaleID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @languageLocaleID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M185"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M185"/>
   <xsl:template match="@*|node()" priority="-2" mode="M185">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M185"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:PackQuantity"
                 priority="1000"
                 mode="M186">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:PackQuantity"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:PackQuantity' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M186"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M186"/>
   <xsl:template match="@*|node()" priority="-2" mode="M186">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M186"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:PackSizeNumeric"
                 priority="1000"
                 mode="M187">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:PackSizeNumeric"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:PackSizeNumeric' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M187"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M187"/>
   <xsl:template match="@*|node()" priority="-2" mode="M187">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M187"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:OrderedShipment"
                 priority="1000"
                 mode="M188">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:OrderedShipment"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:OrderedShipment' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M188"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M188"/>
   <xsl:template match="@*|node()" priority="-2" mode="M188">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M188"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:OriginatorParty"
                 priority="1000"
                 mode="M189">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:OriginatorParty"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:OriginatorParty' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M189"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M189"/>
   <xsl:template match="@*|node()" priority="-2" mode="M189">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M189"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cac:AllowanceCharge"
                 priority="1000"
                 mode="M190">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cac:AllowanceCharge"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:AllowanceCharge' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M190"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M190"/>
   <xsl:template match="@*|node()" priority="-2" mode="M190">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M190"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cac:PriceList"
                 priority="1000"
                 mode="M191">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cac:PriceList"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:PriceList' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M191"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M191"/>
   <xsl:template match="@*|node()" priority="-2" mode="M191">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M191"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cac:PricingExchangeRate"
                 priority="1000"
                 mode="M192">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cac:PricingExchangeRate"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:PricingExchangeRate' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M192"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M192"/>
   <xsl:template match="@*|node()" priority="-2" mode="M192">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M192"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cac:ValidityPeriod"
                 priority="1000"
                 mode="M193">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cac:ValidityPeriod"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M193"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M193"/>
   <xsl:template match="@*|node()" priority="-2" mode="M193">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M193"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cbc:BaseQuantity"
                 priority="1000"
                 mode="M194">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cbc:BaseQuantity"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="@unitCode"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="@unitCode">
               <xsl:attribute name="id">PEPPOL_CORE_R001</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute '@unitCode' is required in this context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="@unitCodeListID"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="@unitCodeListID">
               <xsl:attribute name="id">PEPPOL_CORE_R001</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute '@unitCodeListID' is required in this context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M194"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M194"/>
   <xsl:template match="@*|node()" priority="-2" mode="M194">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M194"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cbc:BaseQuantity[@unitCodeListAgencyID]"
                 priority="1000"
                 mode="M195">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cbc:BaseQuantity[@unitCodeListAgencyID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @unitCodeListAgencyID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M195"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M195"/>
   <xsl:template match="@*|node()" priority="-2" mode="M195">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M195"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cbc:BaseQuantity[@unitCodeListAgencyName]"
                 priority="1000"
                 mode="M196">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cbc:BaseQuantity[@unitCodeListAgencyName]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @unitCodeListAgencyName' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M196"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M196"/>
   <xsl:template match="@*|node()" priority="-2" mode="M196">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M196"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cbc:OrderableUnitFactorRate"
                 priority="1000"
                 mode="M197">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cbc:OrderableUnitFactorRate"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:OrderableUnitFactorRate' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M197"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M197"/>
   <xsl:template match="@*|node()" priority="-2" mode="M197">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M197"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cbc:PriceChangeReason"
                 priority="1000"
                 mode="M198">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cbc:PriceChangeReason"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:PriceChangeReason' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M198"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M198"/>
   <xsl:template match="@*|node()" priority="-2" mode="M198">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M198"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cbc:PriceType"
                 priority="1000"
                 mode="M199">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cbc:PriceType"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:PriceType' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M199"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M199"/>
   <xsl:template match="@*|node()" priority="-2" mode="M199">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M199"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cbc:PriceTypeCode"
                 priority="1000"
                 mode="M200">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cbc:PriceTypeCode"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:PriceTypeCode' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M200"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M200"/>
   <xsl:template match="@*|node()" priority="-2" mode="M200">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M200"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:PricingReference"
                 priority="1000"
                 mode="M201">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:PricingReference"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:PricingReference' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M201"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M201"/>
   <xsl:template match="@*|node()" priority="-2" mode="M201">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M201"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:SubLineItem"
                 priority="1000"
                 mode="M202">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:SubLineItem"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:SubLineItem' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M202"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M202"/>
   <xsl:template match="@*|node()" priority="-2" mode="M202">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M202"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:WarrantyParty"
                 priority="1000"
                 mode="M203">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:WarrantyParty"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:WarrantyParty' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M203"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M203"/>
   <xsl:template match="@*|node()" priority="-2" mode="M203">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M203"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:WarrantyValidityPeriod"
                 priority="1000"
                 mode="M204">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cac:WarrantyValidityPeriod"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:WarrantyValidityPeriod' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M204"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M204"/>
   <xsl:template match="@*|node()" priority="-2" mode="M204">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M204"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:AccountingCost"
                 priority="1000"
                 mode="M205">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:AccountingCost"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:AccountingCost' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M205"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M205"/>
   <xsl:template match="@*|node()" priority="-2" mode="M205">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M205"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:AccountingCostCode"
                 priority="1000"
                 mode="M206">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:AccountingCostCode"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:AccountingCostCode' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M206"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M206"/>
   <xsl:template match="@*|node()" priority="-2" mode="M206">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M206"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:BackOrderAllowedIndicator"
                 priority="1000"
                 mode="M207">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:BackOrderAllowedIndicator"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:BackOrderAllowedIndicator' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M207"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M207"/>
   <xsl:template match="@*|node()" priority="-2" mode="M207">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M207"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:ID[@schemeAgencyID]"
                 priority="1000"
                 mode="M208">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:ID[@schemeAgencyID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeAgencyID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M208"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M208"/>
   <xsl:template match="@*|node()" priority="-2" mode="M208">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M208"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:ID[@schemeAgencyName]"
                 priority="1000"
                 mode="M209">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:ID[@schemeAgencyName]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeAgencyName' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M209"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M209"/>
   <xsl:template match="@*|node()" priority="-2" mode="M209">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M209"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:ID[@schemeDataURI]"
                 priority="1000"
                 mode="M210">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:ID[@schemeDataURI]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeDataURI' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M210"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M210"/>
   <xsl:template match="@*|node()" priority="-2" mode="M210">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M210"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:ID[@schemeID]"
                 priority="1000"
                 mode="M211">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:ID[@schemeID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M211"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M211"/>
   <xsl:template match="@*|node()" priority="-2" mode="M211">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M211"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:ID[@schemeName]"
                 priority="1000"
                 mode="M212">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:ID[@schemeName]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeName' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M212"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M212"/>
   <xsl:template match="@*|node()" priority="-2" mode="M212">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M212"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:ID[@schemeURI]"
                 priority="1000"
                 mode="M213">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:ID[@schemeURI]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeURI' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M213"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M213"/>
   <xsl:template match="@*|node()" priority="-2" mode="M213">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M213"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:ID[@schemeVersionID]"
                 priority="1000"
                 mode="M214">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:ID[@schemeVersionID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeVersionID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M214"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M214"/>
   <xsl:template match="@*|node()" priority="-2" mode="M214">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M214"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:InspectionMethodCode"
                 priority="1000"
                 mode="M215">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:InspectionMethodCode"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:InspectionMethodCode' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M215"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M215"/>
   <xsl:template match="@*|node()" priority="-2" mode="M215">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M215"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:LineExtensionAmount"
                 priority="1000"
                 mode="M216">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:LineExtensionAmount"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:LineExtensionAmount' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M216"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M216"/>
   <xsl:template match="@*|node()" priority="-2" mode="M216">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M216"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:LineStatusCode"
                 priority="1000"
                 mode="M217">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:LineStatusCode"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="@listID"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="@listID">
               <xsl:attribute name="id">PEPPOL_CORE_R001</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute '@listID' is required in this context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M217"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M217"/>
   <xsl:template match="@*|node()" priority="-2" mode="M217">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M217"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:LineStatusCode[@languageID]"
                 priority="1000"
                 mode="M218">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:LineStatusCode[@languageID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @languageID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M218"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M218"/>
   <xsl:template match="@*|node()" priority="-2" mode="M218">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M218"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:LineStatusCode[@listAgencyID]"
                 priority="1000"
                 mode="M219">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:LineStatusCode[@listAgencyID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @listAgencyID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M219"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M219"/>
   <xsl:template match="@*|node()" priority="-2" mode="M219">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M219"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:LineStatusCode[@listAgencyName]"
                 priority="1000"
                 mode="M220">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:LineStatusCode[@listAgencyName]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @listAgencyName' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M220"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M220"/>
   <xsl:template match="@*|node()" priority="-2" mode="M220">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M220"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:LineStatusCode[@listName]"
                 priority="1000"
                 mode="M221">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:LineStatusCode[@listName]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @listName' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M221"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M221"/>
   <xsl:template match="@*|node()" priority="-2" mode="M221">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M221"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:LineStatusCode[@listSchemeURI]"
                 priority="1000"
                 mode="M222">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:LineStatusCode[@listSchemeURI]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @listSchemeURI' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M222"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M222"/>
   <xsl:template match="@*|node()" priority="-2" mode="M222">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M222"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:LineStatusCode[@listURI]"
                 priority="1000"
                 mode="M223">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:LineStatusCode[@listURI]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @listURI' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M223"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M223"/>
   <xsl:template match="@*|node()" priority="-2" mode="M223">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M223"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:LineStatusCode[@listVersionID]"
                 priority="1000"
                 mode="M224">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:LineStatusCode[@listVersionID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @listVersionID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M224"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M224"/>
   <xsl:template match="@*|node()" priority="-2" mode="M224">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M224"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:LineStatusCode[@name]"
                 priority="1000"
                 mode="M225">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:LineStatusCode[@name]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @name' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M225"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M225"/>
   <xsl:template match="@*|node()" priority="-2" mode="M225">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M225"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:MaximumBackorderQuantity"
                 priority="1000"
                 mode="M226">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:MaximumBackorderQuantity"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:MaximumBackorderQuantity' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M226"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M226"/>
   <xsl:template match="@*|node()" priority="-2" mode="M226">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M226"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:MaximumQuantity"
                 priority="1000"
                 mode="M227">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:MaximumQuantity"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:MaximumQuantity' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M227"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M227"/>
   <xsl:template match="@*|node()" priority="-2" mode="M227">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M227"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:MinimumBackorderQuantity"
                 priority="1000"
                 mode="M228">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:MinimumBackorderQuantity"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:MinimumBackorderQuantity' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M228"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M228"/>
   <xsl:template match="@*|node()" priority="-2" mode="M228">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M228"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:MinimumQuantity"
                 priority="1000"
                 mode="M229">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:MinimumQuantity"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:MinimumQuantity' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M229"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M229"/>
   <xsl:template match="@*|node()" priority="-2" mode="M229">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M229"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:Note[@languageID]"
                 priority="1000"
                 mode="M230">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:Note[@languageID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @languageID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M230"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M230"/>
   <xsl:template match="@*|node()" priority="-2" mode="M230">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M230"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:Note[@languageLocaleID]"
                 priority="1000"
                 mode="M231">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:Note[@languageLocaleID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @languageLocaleID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M231"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M231"/>
   <xsl:template match="@*|node()" priority="-2" mode="M231">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M231"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:PartialDeliveryIndicator"
                 priority="1000"
                 mode="M232">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:PartialDeliveryIndicator"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:PartialDeliveryIndicator' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M232"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M232"/>
   <xsl:template match="@*|node()" priority="-2" mode="M232">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M232"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:Quantity"
                 priority="1000"
                 mode="M233">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:Quantity"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="@unitCode"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="@unitCode">
               <xsl:attribute name="id">PEPPOL_CORE_R001</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute '@unitCode' is required in this context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="@unitCodeListID"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="@unitCodeListID">
               <xsl:attribute name="id">PEPPOL_CORE_R001</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute '@unitCodeListID' is required in this context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M233"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M233"/>
   <xsl:template match="@*|node()" priority="-2" mode="M233">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M233"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:Quantity[@unitCodeListAgencyID]"
                 priority="1000"
                 mode="M234">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:Quantity[@unitCodeListAgencyID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @unitCodeListAgencyID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M234"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M234"/>
   <xsl:template match="@*|node()" priority="-2" mode="M234">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M234"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:Quantity[@unitCodeListAgencyName]"
                 priority="1000"
                 mode="M235">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:Quantity[@unitCodeListAgencyName]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @unitCodeListAgencyName' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M235"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M235"/>
   <xsl:template match="@*|node()" priority="-2" mode="M235">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M235"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:SalesOrderID"
                 priority="1000"
                 mode="M236">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:SalesOrderID"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:SalesOrderID' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M236"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M236"/>
   <xsl:template match="@*|node()" priority="-2" mode="M236">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M236"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:TotalTaxAmount"
                 priority="1000"
                 mode="M237">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:TotalTaxAmount"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:TotalTaxAmount' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M237"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M237"/>
   <xsl:template match="@*|node()" priority="-2" mode="M237">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M237"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:UUID"
                 priority="1000"
                 mode="M238">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:UUID"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:UUID' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M238"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M238"/>
   <xsl:template match="@*|node()" priority="-2" mode="M238">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M238"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:WarrantyInformation"
                 priority="1000"
                 mode="M239">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:LineItem/cbc:WarrantyInformation"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:WarrantyInformation' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M239"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M239"/>
   <xsl:template match="@*|node()" priority="-2" mode="M239">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M239"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:OrderLineReference/cac:OrderReference"
                 priority="1000"
                 mode="M240">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:OrderLineReference/cac:OrderReference"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:OrderReference' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M240"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M240"/>
   <xsl:template match="@*|node()" priority="-2" mode="M240">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M240"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:OrderLineReference/cbc:LineID[@schemeAgencyID]"
                 priority="1000"
                 mode="M241">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:OrderLineReference/cbc:LineID[@schemeAgencyID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeAgencyID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M241"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M241"/>
   <xsl:template match="@*|node()" priority="-2" mode="M241">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M241"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:OrderLineReference/cbc:LineID[@schemeAgencyName]"
                 priority="1000"
                 mode="M242">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:OrderLineReference/cbc:LineID[@schemeAgencyName]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeAgencyName' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M242"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M242"/>
   <xsl:template match="@*|node()" priority="-2" mode="M242">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M242"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:OrderLineReference/cbc:LineID[@schemeDataURI]"
                 priority="1000"
                 mode="M243">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:OrderLineReference/cbc:LineID[@schemeDataURI]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeDataURI' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M243"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M243"/>
   <xsl:template match="@*|node()" priority="-2" mode="M243">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M243"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:OrderLineReference/cbc:LineID[@schemeID]"
                 priority="1000"
                 mode="M244">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:OrderLineReference/cbc:LineID[@schemeID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M244"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M244"/>
   <xsl:template match="@*|node()" priority="-2" mode="M244">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M244"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:OrderLineReference/cbc:LineID[@schemeName]"
                 priority="1000"
                 mode="M245">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:OrderLineReference/cbc:LineID[@schemeName]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeName' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M245"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M245"/>
   <xsl:template match="@*|node()" priority="-2" mode="M245">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M245"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:OrderLineReference/cbc:LineID[@schemeURI]"
                 priority="1000"
                 mode="M246">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:OrderLineReference/cbc:LineID[@schemeURI]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeURI' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M246"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M246"/>
   <xsl:template match="@*|node()" priority="-2" mode="M246">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M246"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:OrderLineReference/cbc:LineID[@schemeVersionID]"
                 priority="1000"
                 mode="M247">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:OrderLineReference/cbc:LineID[@schemeVersionID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeVersionID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M247"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M247"/>
   <xsl:template match="@*|node()" priority="-2" mode="M247">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M247"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:OrderLineReference/cbc:LineStatusCode"
                 priority="1000"
                 mode="M248">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:OrderLineReference/cbc:LineStatusCode"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:LineStatusCode' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M248"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M248"/>
   <xsl:template match="@*|node()" priority="-2" mode="M248">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M248"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:OrderLineReference/cbc:SalesOrderLineID"
                 priority="1000"
                 mode="M249">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:OrderLineReference/cbc:SalesOrderLineID"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:SalesOrderLineID' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M249"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M249"/>
   <xsl:template match="@*|node()" priority="-2" mode="M249">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M249"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:OrderLineReference/cbc:UUID"
                 priority="1000"
                 mode="M250">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:OrderLineReference/cbc:UUID"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:UUID' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M250"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M250"/>
   <xsl:template match="@*|node()" priority="-2" mode="M250">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M250"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:QuotationLineReference"
                 priority="1000"
                 mode="M251">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:QuotationLineReference"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:QuotationLineReference' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M251"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M251"/>
   <xsl:template match="@*|node()" priority="-2" mode="M251">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M251"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerProposedSubstituteLineItem"
                 priority="1000"
                 mode="M252">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerProposedSubstituteLineItem"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:SellerProposedSubstituteLineItem' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M252"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M252"/>
   <xsl:template match="@*|node()" priority="-2" mode="M252">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M252"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:AllowanceCharge"
                 priority="1000"
                 mode="M253">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:AllowanceCharge"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:AllowanceCharge' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M253"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M253"/>
   <xsl:template match="@*|node()" priority="-2" mode="M253">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M253"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Delivery"
                 priority="1000"
                 mode="M254">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Delivery"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:Delivery' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M254"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M254"/>
   <xsl:template match="@*|node()" priority="-2" mode="M254">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M254"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:DeliveryTerms"
                 priority="1000"
                 mode="M255">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:DeliveryTerms"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:DeliveryTerms' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M255"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M255"/>
   <xsl:template match="@*|node()" priority="-2" mode="M255">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M255"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item"
                 priority="1000"
                 mode="M256">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="count(cac:ClassifiedTaxCategory)&lt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                test="count(cac:ClassifiedTaxCategory)&lt;=1">
               <xsl:attribute name="id">PEPPOL_CORE_R001</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:ClassifiedTaxCategory' may occur at maximum 1 times.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M256"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M256"/>
   <xsl:template match="@*|node()" priority="-2" mode="M256">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M256"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemIdentification"
                 priority="1000"
                 mode="M257">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemIdentification"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:AdditionalItemIdentification' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M257"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M257"/>
   <xsl:template match="@*|node()" priority="-2" mode="M257">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M257"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty"
                 priority="1000"
                 mode="M258">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="count(cbc:Value)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="count(cbc:Value)=1">
               <xsl:attribute name="id">PEPPOL_CORE_R001</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:Value' must occur exactly 1 times.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="count(cbc:ValueQualifier)&lt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                test="count(cbc:ValueQualifier)&lt;=1">
               <xsl:attribute name="id">PEPPOL_CORE_R001</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:ValueQualifier' may occur at maximum 1 times.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M258"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M258"/>
   <xsl:template match="@*|node()" priority="-2" mode="M258">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M258"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cac:ItemPropertyGroup"
                 priority="1000"
                 mode="M259">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cac:ItemPropertyGroup"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:ItemPropertyGroup' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M259"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M259"/>
   <xsl:template match="@*|node()" priority="-2" mode="M259">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M259"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cac:ItemPropertyRange"
                 priority="1000"
                 mode="M260">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cac:ItemPropertyRange"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:ItemPropertyRange' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M260"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M260"/>
   <xsl:template match="@*|node()" priority="-2" mode="M260">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M260"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cac:RangeDimension"
                 priority="1000"
                 mode="M261">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cac:RangeDimension"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:RangeDimension' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M261"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M261"/>
   <xsl:template match="@*|node()" priority="-2" mode="M261">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M261"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cac:UsabilityPeriod"
                 priority="1000"
                 mode="M262">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cac:UsabilityPeriod"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:UsabilityPeriod' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M262"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M262"/>
   <xsl:template match="@*|node()" priority="-2" mode="M262">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M262"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:ID"
                 priority="1000"
                 mode="M263">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:ID"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:ID' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M263"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M263"/>
   <xsl:template match="@*|node()" priority="-2" mode="M263">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M263"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:ImportanceCode"
                 priority="1000"
                 mode="M264">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:ImportanceCode"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:ImportanceCode' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M264"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M264"/>
   <xsl:template match="@*|node()" priority="-2" mode="M264">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M264"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:ListValue"
                 priority="1000"
                 mode="M265">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:ListValue"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:ListValue' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M265"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M265"/>
   <xsl:template match="@*|node()" priority="-2" mode="M265">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M265"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:NameCode"
                 priority="1000"
                 mode="M266">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:NameCode"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:NameCode' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M266"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M266"/>
   <xsl:template match="@*|node()" priority="-2" mode="M266">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M266"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:Name[@languageID]"
                 priority="1000"
                 mode="M267">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:Name[@languageID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @languageID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M267"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M267"/>
   <xsl:template match="@*|node()" priority="-2" mode="M267">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M267"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:Name[@languageLocaleID]"
                 priority="1000"
                 mode="M268">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:Name[@languageLocaleID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @languageLocaleID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M268"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M268"/>
   <xsl:template match="@*|node()" priority="-2" mode="M268">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M268"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:TestMethod"
                 priority="1000"
                 mode="M269">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:TestMethod"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:TestMethod' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M269"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M269"/>
   <xsl:template match="@*|node()" priority="-2" mode="M269">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M269"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:ValueQualifier[@languageID]"
                 priority="1000"
                 mode="M270">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:ValueQualifier[@languageID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @languageID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M270"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M270"/>
   <xsl:template match="@*|node()" priority="-2" mode="M270">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M270"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:ValueQualifier[@languageLocaleID]"
                 priority="1000"
                 mode="M271">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:ValueQualifier[@languageLocaleID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @languageLocaleID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M271"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M271"/>
   <xsl:template match="@*|node()" priority="-2" mode="M271">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M271"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:ValueQuantity"
                 priority="1000"
                 mode="M272">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:ValueQuantity"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="@unitCode"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="@unitCode">
               <xsl:attribute name="id">PEPPOL_CORE_R001</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute '@unitCode' is required in this context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="@unitCodeListID"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="@unitCodeListID">
               <xsl:attribute name="id">PEPPOL_CORE_R001</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute '@unitCodeListID' is required in this context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M272"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M272"/>
   <xsl:template match="@*|node()" priority="-2" mode="M272">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M272"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:ValueQuantity[@unitCodeListAgencyID]"
                 priority="1000"
                 mode="M273">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:ValueQuantity[@unitCodeListAgencyID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @unitCodeListAgencyID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M273"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M273"/>
   <xsl:template match="@*|node()" priority="-2" mode="M273">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M273"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:ValueQuantity[@unitCodeListAgencyName]"
                 priority="1000"
                 mode="M274">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:ValueQuantity[@unitCodeListAgencyName]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @unitCodeListAgencyName' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M274"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M274"/>
   <xsl:template match="@*|node()" priority="-2" mode="M274">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M274"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:Value[@languageID]"
                 priority="1000"
                 mode="M275">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:Value[@languageID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @languageID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M275"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M275"/>
   <xsl:template match="@*|node()" priority="-2" mode="M275">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M275"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:Value[@languageLocaleID]"
                 priority="1000"
                 mode="M276">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:AdditionalItemProperty/cbc:Value[@languageLocaleID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @languageLocaleID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M276"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M276"/>
   <xsl:template match="@*|node()" priority="-2" mode="M276">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M276"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:BuyersItemIdentification"
                 priority="1000"
                 mode="M277">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:BuyersItemIdentification"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:BuyersItemIdentification' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M277"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M277"/>
   <xsl:template match="@*|node()" priority="-2" mode="M277">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M277"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CatalogueDocumentReference"
                 priority="1000"
                 mode="M278">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CatalogueDocumentReference"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:CatalogueDocumentReference' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M278"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M278"/>
   <xsl:template match="@*|node()" priority="-2" mode="M278">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M278"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CatalogueItemIdentification"
                 priority="1000"
                 mode="M279">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CatalogueItemIdentification"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:CatalogueItemIdentification' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M279"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M279"/>
   <xsl:template match="@*|node()" priority="-2" mode="M279">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M279"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:Certificate"
                 priority="1000"
                 mode="M280">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:Certificate"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:Certificate' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M280"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M280"/>
   <xsl:template match="@*|node()" priority="-2" mode="M280">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M280"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory"
                 priority="1000"
                 mode="M281">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="count(cbc:ID)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="count(cbc:ID)=1">
               <xsl:attribute name="id">PEPPOL_CORE_R001</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:ID' must occur exactly 1 times.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M281"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M281"/>
   <xsl:template match="@*|node()" priority="-2" mode="M281">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M281"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme"
                 priority="1000"
                 mode="M282">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="count(cbc:ID)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="count(cbc:ID)=1">
               <xsl:attribute name="id">PEPPOL_CORE_R001</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:ID' must occur exactly 1 times.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M282"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M282"/>
   <xsl:template match="@*|node()" priority="-2" mode="M282">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M282"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cac:JurisdictionRegionAddress"
                 priority="1000"
                 mode="M283">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cac:JurisdictionRegionAddress"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:JurisdictionRegionAddress' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M283"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M283"/>
   <xsl:template match="@*|node()" priority="-2" mode="M283">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M283"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:CurrencyCode"
                 priority="1000"
                 mode="M284">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:CurrencyCode"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:CurrencyCode' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M284"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M284"/>
   <xsl:template match="@*|node()" priority="-2" mode="M284">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M284"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeAgencyID]"
                 priority="1000"
                 mode="M285">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeAgencyID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeAgencyID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M285"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M285"/>
   <xsl:template match="@*|node()" priority="-2" mode="M285">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M285"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeAgencyName]"
                 priority="1000"
                 mode="M286">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeAgencyName]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeAgencyName' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M286"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M286"/>
   <xsl:template match="@*|node()" priority="-2" mode="M286">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M286"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeDataURI]"
                 priority="1000"
                 mode="M287">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeDataURI]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeDataURI' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M287"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M287"/>
   <xsl:template match="@*|node()" priority="-2" mode="M287">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M287"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeID]"
                 priority="1000"
                 mode="M288">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M288"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M288"/>
   <xsl:template match="@*|node()" priority="-2" mode="M288">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M288"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeName]"
                 priority="1000"
                 mode="M289">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeName]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeName' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M289"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M289"/>
   <xsl:template match="@*|node()" priority="-2" mode="M289">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M289"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeURI]"
                 priority="1000"
                 mode="M290">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeURI]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeURI' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M290"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M290"/>
   <xsl:template match="@*|node()" priority="-2" mode="M290">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M290"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeVersionID]"
                 priority="1000"
                 mode="M291">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID[@schemeVersionID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeVersionID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M291"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M291"/>
   <xsl:template match="@*|node()" priority="-2" mode="M291">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M291"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:Name"
                 priority="1000"
                 mode="M292">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:Name"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:Name' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M292"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M292"/>
   <xsl:template match="@*|node()" priority="-2" mode="M292">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M292"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:TaxTypeCode"
                 priority="1000"
                 mode="M293">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:TaxTypeCode"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:TaxTypeCode' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M293"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M293"/>
   <xsl:template match="@*|node()" priority="-2" mode="M293">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M293"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:BaseUnitMeasure"
                 priority="1000"
                 mode="M294">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:BaseUnitMeasure"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:BaseUnitMeasure' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M294"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M294"/>
   <xsl:template match="@*|node()" priority="-2" mode="M294">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M294"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:ID"
                 priority="1000"
                 mode="M295">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:ID"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="@schemeID"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="@schemeID">
               <xsl:attribute name="id">PEPPOL_CORE_R001</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute '@schemeID' is required in this context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M295"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M295"/>
   <xsl:template match="@*|node()" priority="-2" mode="M295">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M295"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeAgencyID]"
                 priority="1000"
                 mode="M296">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeAgencyID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeAgencyID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M296"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M296"/>
   <xsl:template match="@*|node()" priority="-2" mode="M296">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M296"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeAgencyName]"
                 priority="1000"
                 mode="M297">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeAgencyName]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeAgencyName' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M297"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M297"/>
   <xsl:template match="@*|node()" priority="-2" mode="M297">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M297"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeDataURI]"
                 priority="1000"
                 mode="M298">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeDataURI]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeDataURI' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M298"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M298"/>
   <xsl:template match="@*|node()" priority="-2" mode="M298">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M298"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeName]"
                 priority="1000"
                 mode="M299">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeName]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeName' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M299"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M299"/>
   <xsl:template match="@*|node()" priority="-2" mode="M299">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M299"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeURI]"
                 priority="1000"
                 mode="M300">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeURI]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeURI' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M300"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M300"/>
   <xsl:template match="@*|node()" priority="-2" mode="M300">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M300"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeVersionID]"
                 priority="1000"
                 mode="M301">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:ID[@schemeVersionID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeVersionID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M301"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M301"/>
   <xsl:template match="@*|node()" priority="-2" mode="M301">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M301"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:Name"
                 priority="1000"
                 mode="M302">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:Name"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:Name' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M302"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M302"/>
   <xsl:template match="@*|node()" priority="-2" mode="M302">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M302"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:PerUnitAmount"
                 priority="1000"
                 mode="M303">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:PerUnitAmount"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:PerUnitAmount' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M303"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M303"/>
   <xsl:template match="@*|node()" priority="-2" mode="M303">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M303"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:Percent[@format]"
                 priority="1000"
                 mode="M304">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:Percent[@format]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @format' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M304"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M304"/>
   <xsl:template match="@*|node()" priority="-2" mode="M304">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M304"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:TaxExemptionReason"
                 priority="1000"
                 mode="M305">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:TaxExemptionReason"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:TaxExemptionReason' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M305"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M305"/>
   <xsl:template match="@*|node()" priority="-2" mode="M305">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M305"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:TaxExemptionReasonCode"
                 priority="1000"
                 mode="M306">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:TaxExemptionReasonCode"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:TaxExemptionReasonCode' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M306"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M306"/>
   <xsl:template match="@*|node()" priority="-2" mode="M306">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M306"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:TierRange"
                 priority="1000"
                 mode="M307">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:TierRange"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:TierRange' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M307"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M307"/>
   <xsl:template match="@*|node()" priority="-2" mode="M307">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M307"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:TierRatePercent"
                 priority="1000"
                 mode="M308">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:TierRatePercent"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:TierRatePercent' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M308"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M308"/>
   <xsl:template match="@*|node()" priority="-2" mode="M308">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M308"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification"
                 priority="1000"
                 mode="M309">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="count(cbc:ItemClassificationCode)=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                test="count(cbc:ItemClassificationCode)=1">
               <xsl:attribute name="id">PEPPOL_CORE_R001</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:ItemClassificationCode' must occur exactly 1 times.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M309"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M309"/>
   <xsl:template match="@*|node()" priority="-2" mode="M309">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M309"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification/cbc:CargoTypeCode"
                 priority="1000"
                 mode="M310">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification/cbc:CargoTypeCode"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:CargoTypeCode' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M310"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M310"/>
   <xsl:template match="@*|node()" priority="-2" mode="M310">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M310"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification/cbc:CommodityCode"
                 priority="1000"
                 mode="M311">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification/cbc:CommodityCode"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:CommodityCode' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M311"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M311"/>
   <xsl:template match="@*|node()" priority="-2" mode="M311">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M311"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@languageID]"
                 priority="1000"
                 mode="M312">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@languageID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @languageID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M312"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M312"/>
   <xsl:template match="@*|node()" priority="-2" mode="M312">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M312"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listAgencyID]"
                 priority="1000"
                 mode="M313">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listAgencyID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @listAgencyID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M313"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M313"/>
   <xsl:template match="@*|node()" priority="-2" mode="M313">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M313"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listAgencyName]"
                 priority="1000"
                 mode="M314">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listAgencyName]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @listAgencyName' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M314"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M314"/>
   <xsl:template match="@*|node()" priority="-2" mode="M314">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M314"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listName]"
                 priority="1000"
                 mode="M315">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listName]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @listName' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M315"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M315"/>
   <xsl:template match="@*|node()" priority="-2" mode="M315">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M315"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listSchemeURI]"
                 priority="1000"
                 mode="M316">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listSchemeURI]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @listSchemeURI' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M316"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M316"/>
   <xsl:template match="@*|node()" priority="-2" mode="M316">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M316"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listURI]"
                 priority="1000"
                 mode="M317">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listURI]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @listURI' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M317"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M317"/>
   <xsl:template match="@*|node()" priority="-2" mode="M317">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M317"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listVersionID]"
                 priority="1000"
                 mode="M318">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@listVersionID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @listVersionID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M318"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M318"/>
   <xsl:template match="@*|node()" priority="-2" mode="M318">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M318"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@name]"
                 priority="1000"
                 mode="M319">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode[@name]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @name' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M319"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M319"/>
   <xsl:template match="@*|node()" priority="-2" mode="M319">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M319"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification/cbc:NatureCode"
                 priority="1000"
                 mode="M320">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:CommodityClassification/cbc:NatureCode"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:NatureCode' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M320"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M320"/>
   <xsl:template match="@*|node()" priority="-2" mode="M320">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M320"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:Dimension"
                 priority="1000"
                 mode="M321">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:Dimension"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:Dimension' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M321"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M321"/>
   <xsl:template match="@*|node()" priority="-2" mode="M321">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M321"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:HazardousItem"
                 priority="1000"
                 mode="M322">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:HazardousItem"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:HazardousItem' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M322"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M322"/>
   <xsl:template match="@*|node()" priority="-2" mode="M322">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M322"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:InformationContentProviderParty"
                 priority="1000"
                 mode="M323">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:InformationContentProviderParty"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:InformationContentProviderParty' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M323"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M323"/>
   <xsl:template match="@*|node()" priority="-2" mode="M323">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M323"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ItemInstance"
                 priority="1000"
                 mode="M324">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ItemInstance"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:ItemInstance' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M324"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M324"/>
   <xsl:template match="@*|node()" priority="-2" mode="M324">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M324"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ItemSpecificationDocumentReference"
                 priority="1000"
                 mode="M325">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ItemSpecificationDocumentReference"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:ItemSpecificationDocumentReference' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M325"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M325"/>
   <xsl:template match="@*|node()" priority="-2" mode="M325">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M325"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ManufacturerParty"
                 priority="1000"
                 mode="M326">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ManufacturerParty"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:ManufacturerParty' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M326"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M326"/>
   <xsl:template match="@*|node()" priority="-2" mode="M326">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M326"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ManufacturersItemIdentification"
                 priority="1000"
                 mode="M327">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:ManufacturersItemIdentification"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:ManufacturersItemIdentification' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M327"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M327"/>
   <xsl:template match="@*|node()" priority="-2" mode="M327">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M327"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:OriginAddress"
                 priority="1000"
                 mode="M328">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:OriginAddress"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:OriginAddress' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M328"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M328"/>
   <xsl:template match="@*|node()" priority="-2" mode="M328">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M328"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:OriginCountry"
                 priority="1000"
                 mode="M329">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:OriginCountry"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:OriginCountry' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M329"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M329"/>
   <xsl:template match="@*|node()" priority="-2" mode="M329">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M329"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:SellersItemIdentification/cac:IssuerParty"
                 priority="1000"
                 mode="M330">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:SellersItemIdentification/cac:IssuerParty"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:IssuerParty' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M330"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M330"/>
   <xsl:template match="@*|node()" priority="-2" mode="M330">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M330"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:SellersItemIdentification/cac:MeasurementDimension"
                 priority="1000"
                 mode="M331">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:SellersItemIdentification/cac:MeasurementDimension"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:MeasurementDimension' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M331"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M331"/>
   <xsl:template match="@*|node()" priority="-2" mode="M331">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M331"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:SellersItemIdentification/cac:PhysicalAttribute"
                 priority="1000"
                 mode="M332">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:SellersItemIdentification/cac:PhysicalAttribute"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:PhysicalAttribute' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M332"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M332"/>
   <xsl:template match="@*|node()" priority="-2" mode="M332">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M332"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:SellersItemIdentification/cbc:BarcodeSymbologyID"
                 priority="1000"
                 mode="M333">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:SellersItemIdentification/cbc:BarcodeSymbologyID"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:BarcodeSymbologyID' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M333"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M333"/>
   <xsl:template match="@*|node()" priority="-2" mode="M333">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M333"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:SellersItemIdentification/cbc:ExtendedID"
                 priority="1000"
                 mode="M334">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:SellersItemIdentification/cbc:ExtendedID"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:ExtendedID' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M334"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M334"/>
   <xsl:template match="@*|node()" priority="-2" mode="M334">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M334"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeAgencyID]"
                 priority="1000"
                 mode="M335">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeAgencyID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeAgencyID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M335"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M335"/>
   <xsl:template match="@*|node()" priority="-2" mode="M335">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M335"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeAgencyName]"
                 priority="1000"
                 mode="M336">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeAgencyName]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeAgencyName' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M336"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M336"/>
   <xsl:template match="@*|node()" priority="-2" mode="M336">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M336"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeDataURI]"
                 priority="1000"
                 mode="M337">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeDataURI]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeDataURI' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M337"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M337"/>
   <xsl:template match="@*|node()" priority="-2" mode="M337">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M337"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeID]"
                 priority="1000"
                 mode="M338">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M338"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M338"/>
   <xsl:template match="@*|node()" priority="-2" mode="M338">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M338"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeName]"
                 priority="1000"
                 mode="M339">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeName]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeName' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M339"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M339"/>
   <xsl:template match="@*|node()" priority="-2" mode="M339">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M339"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeURI]"
                 priority="1000"
                 mode="M340">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeURI]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeURI' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M340"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M340"/>
   <xsl:template match="@*|node()" priority="-2" mode="M340">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M340"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeVersionID]"
                 priority="1000"
                 mode="M341">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:SellersItemIdentification/cbc:ID[@schemeVersionID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeVersionID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M341"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M341"/>
   <xsl:template match="@*|node()" priority="-2" mode="M341">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M341"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:StandardItemIdentification/cac:IssuerParty"
                 priority="1000"
                 mode="M342">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:StandardItemIdentification/cac:IssuerParty"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:IssuerParty' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M342"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M342"/>
   <xsl:template match="@*|node()" priority="-2" mode="M342">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M342"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:StandardItemIdentification/cac:MeasurementDimension"
                 priority="1000"
                 mode="M343">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:StandardItemIdentification/cac:MeasurementDimension"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:MeasurementDimension' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M343"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M343"/>
   <xsl:template match="@*|node()" priority="-2" mode="M343">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M343"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:StandardItemIdentification/cac:PhysicalAttribute"
                 priority="1000"
                 mode="M344">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:StandardItemIdentification/cac:PhysicalAttribute"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:PhysicalAttribute' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M344"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M344"/>
   <xsl:template match="@*|node()" priority="-2" mode="M344">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M344"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:StandardItemIdentification/cbc:BarcodeSymbologyID"
                 priority="1000"
                 mode="M345">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:StandardItemIdentification/cbc:BarcodeSymbologyID"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:BarcodeSymbologyID' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M345"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M345"/>
   <xsl:template match="@*|node()" priority="-2" mode="M345">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M345"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:StandardItemIdentification/cbc:ExtendedID"
                 priority="1000"
                 mode="M346">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:StandardItemIdentification/cbc:ExtendedID"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:ExtendedID' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M346"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M346"/>
   <xsl:template match="@*|node()" priority="-2" mode="M346">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M346"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeAgencyID]"
                 priority="1000"
                 mode="M347">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeAgencyID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeAgencyID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M347"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M347"/>
   <xsl:template match="@*|node()" priority="-2" mode="M347">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M347"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeAgencyName]"
                 priority="1000"
                 mode="M348">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeAgencyName]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeAgencyName' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M348"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M348"/>
   <xsl:template match="@*|node()" priority="-2" mode="M348">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M348"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeDataURI]"
                 priority="1000"
                 mode="M349">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeDataURI]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeDataURI' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M349"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M349"/>
   <xsl:template match="@*|node()" priority="-2" mode="M349">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M349"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeName]"
                 priority="1000"
                 mode="M350">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeName]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeName' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M350"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M350"/>
   <xsl:template match="@*|node()" priority="-2" mode="M350">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M350"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeURI]"
                 priority="1000"
                 mode="M351">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeURI]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeURI' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M351"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M351"/>
   <xsl:template match="@*|node()" priority="-2" mode="M351">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M351"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeVersionID]"
                 priority="1000"
                 mode="M352">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:StandardItemIdentification/cbc:ID[@schemeVersionID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeVersionID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M352"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M352"/>
   <xsl:template match="@*|node()" priority="-2" mode="M352">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M352"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:TransactionConditions"
                 priority="1000"
                 mode="M353">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cac:TransactionConditions"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:TransactionConditions' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M353"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M353"/>
   <xsl:template match="@*|node()" priority="-2" mode="M353">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M353"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cbc:AdditionalInformation"
                 priority="1000"
                 mode="M354">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cbc:AdditionalInformation"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:AdditionalInformation' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M354"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M354"/>
   <xsl:template match="@*|node()" priority="-2" mode="M354">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M354"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cbc:BrandName"
                 priority="1000"
                 mode="M355">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cbc:BrandName"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:BrandName' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M355"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M355"/>
   <xsl:template match="@*|node()" priority="-2" mode="M355">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M355"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cbc:CatalogueIndicator"
                 priority="1000"
                 mode="M356">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cbc:CatalogueIndicator"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:CatalogueIndicator' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M356"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M356"/>
   <xsl:template match="@*|node()" priority="-2" mode="M356">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M356"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cbc:Description"
                 priority="1000"
                 mode="M357">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cbc:Description"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:Description' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M357"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M357"/>
   <xsl:template match="@*|node()" priority="-2" mode="M357">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M357"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cbc:HazardousRiskIndicator"
                 priority="1000"
                 mode="M358">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cbc:HazardousRiskIndicator"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:HazardousRiskIndicator' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M358"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M358"/>
   <xsl:template match="@*|node()" priority="-2" mode="M358">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M358"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cbc:Keyword"
                 priority="1000"
                 mode="M359">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cbc:Keyword"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:Keyword' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M359"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M359"/>
   <xsl:template match="@*|node()" priority="-2" mode="M359">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M359"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cbc:ModelName"
                 priority="1000"
                 mode="M360">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cbc:ModelName"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:ModelName' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M360"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M360"/>
   <xsl:template match="@*|node()" priority="-2" mode="M360">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M360"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cbc:Name[@languageID]"
                 priority="1000"
                 mode="M361">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cbc:Name[@languageID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @languageID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M361"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M361"/>
   <xsl:template match="@*|node()" priority="-2" mode="M361">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M361"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cbc:Name[@languageLocaleID]"
                 priority="1000"
                 mode="M362">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cbc:Name[@languageLocaleID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @languageLocaleID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M362"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M362"/>
   <xsl:template match="@*|node()" priority="-2" mode="M362">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M362"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cbc:PackQuantity"
                 priority="1000"
                 mode="M363">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cbc:PackQuantity"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:PackQuantity' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M363"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M363"/>
   <xsl:template match="@*|node()" priority="-2" mode="M363">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M363"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cbc:PackSizeNumeric"
                 priority="1000"
                 mode="M364">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Item/cbc:PackSizeNumeric"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:PackSizeNumeric' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M364"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M364"/>
   <xsl:template match="@*|node()" priority="-2" mode="M364">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M364"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:OrderedShipment"
                 priority="1000"
                 mode="M365">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:OrderedShipment"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:OrderedShipment' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M365"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M365"/>
   <xsl:template match="@*|node()" priority="-2" mode="M365">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M365"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:OriginatorParty"
                 priority="1000"
                 mode="M366">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:OriginatorParty"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:OriginatorParty' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M366"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M366"/>
   <xsl:template match="@*|node()" priority="-2" mode="M366">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M366"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Price"
                 priority="1000"
                 mode="M367">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:Price"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:Price' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M367"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M367"/>
   <xsl:template match="@*|node()" priority="-2" mode="M367">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M367"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:PricingReference"
                 priority="1000"
                 mode="M368">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:PricingReference"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:PricingReference' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M368"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M368"/>
   <xsl:template match="@*|node()" priority="-2" mode="M368">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M368"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:SubLineItem"
                 priority="1000"
                 mode="M369">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:SubLineItem"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:SubLineItem' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M369"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M369"/>
   <xsl:template match="@*|node()" priority="-2" mode="M369">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M369"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:WarrantyParty"
                 priority="1000"
                 mode="M370">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:WarrantyParty"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:WarrantyParty' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M370"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M370"/>
   <xsl:template match="@*|node()" priority="-2" mode="M370">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M370"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:WarrantyValidityPeriod"
                 priority="1000"
                 mode="M371">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cac:WarrantyValidityPeriod"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:WarrantyValidityPeriod' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M371"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M371"/>
   <xsl:template match="@*|node()" priority="-2" mode="M371">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M371"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:AccountingCost"
                 priority="1000"
                 mode="M372">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:AccountingCost"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:AccountingCost' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M372"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M372"/>
   <xsl:template match="@*|node()" priority="-2" mode="M372">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M372"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:AccountingCostCode"
                 priority="1000"
                 mode="M373">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:AccountingCostCode"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:AccountingCostCode' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M373"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M373"/>
   <xsl:template match="@*|node()" priority="-2" mode="M373">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M373"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:BackOrderAllowedIndicator"
                 priority="1000"
                 mode="M374">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:BackOrderAllowedIndicator"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:BackOrderAllowedIndicator' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M374"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M374"/>
   <xsl:template match="@*|node()" priority="-2" mode="M374">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M374"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:ID[@schemeAgencyID]"
                 priority="1000"
                 mode="M375">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:ID[@schemeAgencyID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeAgencyID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M375"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M375"/>
   <xsl:template match="@*|node()" priority="-2" mode="M375">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M375"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:ID[@schemeAgencyName]"
                 priority="1000"
                 mode="M376">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:ID[@schemeAgencyName]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeAgencyName' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M376"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M376"/>
   <xsl:template match="@*|node()" priority="-2" mode="M376">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M376"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:ID[@schemeDataURI]"
                 priority="1000"
                 mode="M377">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:ID[@schemeDataURI]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeDataURI' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M377"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M377"/>
   <xsl:template match="@*|node()" priority="-2" mode="M377">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M377"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:ID[@schemeID]"
                 priority="1000"
                 mode="M378">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:ID[@schemeID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M378"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M378"/>
   <xsl:template match="@*|node()" priority="-2" mode="M378">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M378"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:ID[@schemeName]"
                 priority="1000"
                 mode="M379">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:ID[@schemeName]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeName' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M379"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M379"/>
   <xsl:template match="@*|node()" priority="-2" mode="M379">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M379"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:ID[@schemeURI]"
                 priority="1000"
                 mode="M380">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:ID[@schemeURI]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeURI' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M380"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M380"/>
   <xsl:template match="@*|node()" priority="-2" mode="M380">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M380"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:ID[@schemeVersionID]"
                 priority="1000"
                 mode="M381">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:ID[@schemeVersionID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeVersionID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M381"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M381"/>
   <xsl:template match="@*|node()" priority="-2" mode="M381">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M381"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:InspectionMethodCode"
                 priority="1000"
                 mode="M382">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:InspectionMethodCode"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:InspectionMethodCode' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M382"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M382"/>
   <xsl:template match="@*|node()" priority="-2" mode="M382">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M382"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:LineExtensionAmount"
                 priority="1000"
                 mode="M383">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:LineExtensionAmount"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:LineExtensionAmount' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M383"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M383"/>
   <xsl:template match="@*|node()" priority="-2" mode="M383">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M383"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:LineStatusCode"
                 priority="1000"
                 mode="M384">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:LineStatusCode"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:LineStatusCode' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M384"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M384"/>
   <xsl:template match="@*|node()" priority="-2" mode="M384">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M384"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:MaximumBackorderQuantity"
                 priority="1000"
                 mode="M385">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:MaximumBackorderQuantity"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:MaximumBackorderQuantity' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M385"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M385"/>
   <xsl:template match="@*|node()" priority="-2" mode="M385">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M385"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:MaximumQuantity"
                 priority="1000"
                 mode="M386">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:MaximumQuantity"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:MaximumQuantity' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M386"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M386"/>
   <xsl:template match="@*|node()" priority="-2" mode="M386">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M386"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:MinimumBackorderQuantity"
                 priority="1000"
                 mode="M387">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:MinimumBackorderQuantity"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:MinimumBackorderQuantity' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M387"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M387"/>
   <xsl:template match="@*|node()" priority="-2" mode="M387">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M387"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:MinimumQuantity"
                 priority="1000"
                 mode="M388">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:MinimumQuantity"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:MinimumQuantity' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M388"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M388"/>
   <xsl:template match="@*|node()" priority="-2" mode="M388">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M388"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:Note"
                 priority="1000"
                 mode="M389">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:Note"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:Note' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M389"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M389"/>
   <xsl:template match="@*|node()" priority="-2" mode="M389">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M389"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:PartialDeliveryIndicator"
                 priority="1000"
                 mode="M390">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:PartialDeliveryIndicator"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:PartialDeliveryIndicator' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M390"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M390"/>
   <xsl:template match="@*|node()" priority="-2" mode="M390">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M390"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:Quantity"
                 priority="1000"
                 mode="M391">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:Quantity"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:Quantity' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M391"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M391"/>
   <xsl:template match="@*|node()" priority="-2" mode="M391">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M391"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:SalesOrderID"
                 priority="1000"
                 mode="M392">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:SalesOrderID"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:SalesOrderID' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M392"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M392"/>
   <xsl:template match="@*|node()" priority="-2" mode="M392">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M392"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:TotalTaxAmount"
                 priority="1000"
                 mode="M393">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:TotalTaxAmount"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:TotalTaxAmount' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M393"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M393"/>
   <xsl:template match="@*|node()" priority="-2" mode="M393">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M393"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:UUID"
                 priority="1000"
                 mode="M394">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:UUID"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:UUID' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M394"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M394"/>
   <xsl:template match="@*|node()" priority="-2" mode="M394">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M394"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:WarrantyInformation"
                 priority="1000"
                 mode="M395">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cac:SellerSubstitutedLineItem/cbc:WarrantyInformation"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:WarrantyInformation' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M395"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M395"/>
   <xsl:template match="@*|node()" priority="-2" mode="M395">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M395"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cbc:Note"
                 priority="1000"
                 mode="M396">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cbc:Note"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:Note' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M396"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M396"/>
   <xsl:template match="@*|node()" priority="-2" mode="M396">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M396"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderLine/cbc:SubstitutionStatusCode"
                 priority="1000"
                 mode="M397">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderLine/cbc:SubstitutionStatusCode"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:SubstitutionStatusCode' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M397"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M397"/>
   <xsl:template match="@*|node()" priority="-2" mode="M397">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M397"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderReference/cac:DocumentReference"
                 priority="1000"
                 mode="M398">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderReference/cac:DocumentReference"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:DocumentReference' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M398"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M398"/>
   <xsl:template match="@*|node()" priority="-2" mode="M398">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M398"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderReference/cbc:CopyIndicator"
                 priority="1000"
                 mode="M399">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderReference/cbc:CopyIndicator"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M399"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M399"/>
   <xsl:template match="@*|node()" priority="-2" mode="M399">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M399"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderReference/cbc:CustomerReference"
                 priority="1000"
                 mode="M400">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderReference/cbc:CustomerReference"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:CustomerReference' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M400"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M400"/>
   <xsl:template match="@*|node()" priority="-2" mode="M400">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M400"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderReference/cbc:ID[@schemeAgencyID]"
                 priority="1000"
                 mode="M401">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderReference/cbc:ID[@schemeAgencyID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeAgencyID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M401"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M401"/>
   <xsl:template match="@*|node()" priority="-2" mode="M401">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M401"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderReference/cbc:ID[@schemeAgencyName]"
                 priority="1000"
                 mode="M402">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderReference/cbc:ID[@schemeAgencyName]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeAgencyName' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M402"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M402"/>
   <xsl:template match="@*|node()" priority="-2" mode="M402">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M402"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderReference/cbc:ID[@schemeDataURI]"
                 priority="1000"
                 mode="M403">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderReference/cbc:ID[@schemeDataURI]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeDataURI' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M403"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M403"/>
   <xsl:template match="@*|node()" priority="-2" mode="M403">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M403"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderReference/cbc:ID[@schemeID]"
                 priority="1000"
                 mode="M404">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderReference/cbc:ID[@schemeID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M404"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M404"/>
   <xsl:template match="@*|node()" priority="-2" mode="M404">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M404"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderReference/cbc:ID[@schemeName]"
                 priority="1000"
                 mode="M405">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderReference/cbc:ID[@schemeName]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeName' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M405"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M405"/>
   <xsl:template match="@*|node()" priority="-2" mode="M405">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M405"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderReference/cbc:ID[@schemeURI]"
                 priority="1000"
                 mode="M406">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderReference/cbc:ID[@schemeURI]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeURI' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M406"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M406"/>
   <xsl:template match="@*|node()" priority="-2" mode="M406">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M406"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderReference/cbc:ID[@schemeVersionID]"
                 priority="1000"
                 mode="M407">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderReference/cbc:ID[@schemeVersionID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeVersionID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M407"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M407"/>
   <xsl:template match="@*|node()" priority="-2" mode="M407">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M407"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderReference/cbc:IssueDate"
                 priority="1000"
                 mode="M408">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderReference/cbc:IssueDate"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:IssueDate' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M408"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M408"/>
   <xsl:template match="@*|node()" priority="-2" mode="M408">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M408"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderReference/cbc:IssueTime"
                 priority="1000"
                 mode="M409">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderReference/cbc:IssueTime"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:IssueTime' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M409"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M409"/>
   <xsl:template match="@*|node()" priority="-2" mode="M409">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M409"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderReference/cbc:OrderTypeCode"
                 priority="1000"
                 mode="M410">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderReference/cbc:OrderTypeCode"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:OrderTypeCode' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M410"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M410"/>
   <xsl:template match="@*|node()" priority="-2" mode="M410">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M410"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderReference/cbc:SalesOrderID"
                 priority="1000"
                 mode="M411">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderReference/cbc:SalesOrderID"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:SalesOrderID' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M411"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M411"/>
   <xsl:template match="@*|node()" priority="-2" mode="M411">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M411"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OrderReference/cbc:UUID"
                 priority="1000"
                 mode="M412">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OrderReference/cbc:UUID"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:UUID' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M412"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M412"/>
   <xsl:template match="@*|node()" priority="-2" mode="M412">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M412"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OriginatorCustomerParty"
                 priority="1000"
                 mode="M413">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OriginatorCustomerParty"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:OriginatorCustomerParty' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M413"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M413"/>
   <xsl:template match="@*|node()" priority="-2" mode="M413">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M413"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:OriginatorDocumentReference"
                 priority="1000"
                 mode="M414">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:OriginatorDocumentReference"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:OriginatorDocumentReference' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M414"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M414"/>
   <xsl:template match="@*|node()" priority="-2" mode="M414">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M414"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:PaymentExchangeRate"
                 priority="1000"
                 mode="M415">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:PaymentExchangeRate"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:PaymentExchangeRate' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M415"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M415"/>
   <xsl:template match="@*|node()" priority="-2" mode="M415">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M415"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:PaymentMeans"
                 priority="1000"
                 mode="M416">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:PaymentMeans"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:PaymentMeans' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M416"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M416"/>
   <xsl:template match="@*|node()" priority="-2" mode="M416">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M416"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:PaymentTerms"
                 priority="1000"
                 mode="M417">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:PaymentTerms"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:PaymentTerms' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M417"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M417"/>
   <xsl:template match="@*|node()" priority="-2" mode="M417">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M417"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:PricingExchangeRate"
                 priority="1000"
                 mode="M418">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:PricingExchangeRate"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:PricingExchangeRate' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M418"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M418"/>
   <xsl:template match="@*|node()" priority="-2" mode="M418">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M418"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:SellerSupplierParty/cac:AccountingContact"
                 priority="1000"
                 mode="M419">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:SellerSupplierParty/cac:AccountingContact"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:AccountingContact' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M419"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M419"/>
   <xsl:template match="@*|node()" priority="-2" mode="M419">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M419"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:SellerSupplierParty/cac:DespatchContact"
                 priority="1000"
                 mode="M420">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:SellerSupplierParty/cac:DespatchContact"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:DespatchContact' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M420"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M420"/>
   <xsl:template match="@*|node()" priority="-2" mode="M420">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M420"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party"
                 priority="1000"
                 mode="M421">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="count(cac:PartyName)&lt;=1"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="count(cac:PartyName)&lt;=1">
               <xsl:attribute name="id">PEPPOL_CORE_R001</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:PartyName' may occur at maximum 1 times.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M421"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M421"/>
   <xsl:template match="@*|node()" priority="-2" mode="M421">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M421"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:AgentParty"
                 priority="1000"
                 mode="M422">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:AgentParty"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:AgentParty' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M422"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M422"/>
   <xsl:template match="@*|node()" priority="-2" mode="M422">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M422"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cac:OtherCommunication"
                 priority="1000"
                 mode="M423">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cac:OtherCommunication"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:OtherCommunication' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M423"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M423"/>
   <xsl:template match="@*|node()" priority="-2" mode="M423">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M423"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail[@languageID]"
                 priority="1000"
                 mode="M424">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail[@languageID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @languageID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M424"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M424"/>
   <xsl:template match="@*|node()" priority="-2" mode="M424">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M424"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail[@languageLocaleID]"
                 priority="1000"
                 mode="M425">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail[@languageLocaleID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @languageLocaleID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M425"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M425"/>
   <xsl:template match="@*|node()" priority="-2" mode="M425">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M425"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ID"
                 priority="1000"
                 mode="M426">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ID"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:ID' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M426"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M426"/>
   <xsl:template match="@*|node()" priority="-2" mode="M426">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M426"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Name[@languageID]"
                 priority="1000"
                 mode="M427">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Name[@languageID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @languageID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M427"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M427"/>
   <xsl:template match="@*|node()" priority="-2" mode="M427">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M427"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Name[@languageLocaleID]"
                 priority="1000"
                 mode="M428">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Name[@languageLocaleID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @languageLocaleID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M428"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M428"/>
   <xsl:template match="@*|node()" priority="-2" mode="M428">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M428"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Note"
                 priority="1000"
                 mode="M429">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Note"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:Note' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M429"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M429"/>
   <xsl:template match="@*|node()" priority="-2" mode="M429">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M429"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telefax[@languageID]"
                 priority="1000"
                 mode="M430">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telefax[@languageID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @languageID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M430"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M430"/>
   <xsl:template match="@*|node()" priority="-2" mode="M430">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M430"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telefax[@languageLocaleID]"
                 priority="1000"
                 mode="M431">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telefax[@languageLocaleID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @languageLocaleID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M431"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M431"/>
   <xsl:template match="@*|node()" priority="-2" mode="M431">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M431"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telephone[@languageID]"
                 priority="1000"
                 mode="M432">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telephone[@languageID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @languageID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M432"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M432"/>
   <xsl:template match="@*|node()" priority="-2" mode="M432">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M432"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telephone[@languageLocaleID]"
                 priority="1000"
                 mode="M433">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telephone[@languageLocaleID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @languageLocaleID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M433"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M433"/>
   <xsl:template match="@*|node()" priority="-2" mode="M433">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M433"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:FinancialAccount"
                 priority="1000"
                 mode="M434">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:FinancialAccount"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:FinancialAccount' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M434"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M434"/>
   <xsl:template match="@*|node()" priority="-2" mode="M434">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M434"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Language"
                 priority="1000"
                 mode="M435">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Language"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:Language' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M435"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M435"/>
   <xsl:template match="@*|node()" priority="-2" mode="M435">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M435"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID"
                 priority="1000"
                 mode="M436">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="@schemeID"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="@schemeID">
               <xsl:attribute name="id">PEPPOL_CORE_R001</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute '@schemeID' is required in this context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M436"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M436"/>
   <xsl:template match="@*|node()" priority="-2" mode="M436">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M436"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeAgencyID]"
                 priority="1000"
                 mode="M437">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeAgencyID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeAgencyID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M437"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M437"/>
   <xsl:template match="@*|node()" priority="-2" mode="M437">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M437"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeAgencyName]"
                 priority="1000"
                 mode="M438">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeAgencyName]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeAgencyName' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M438"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M438"/>
   <xsl:template match="@*|node()" priority="-2" mode="M438">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M438"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeDataURI]"
                 priority="1000"
                 mode="M439">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeDataURI]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeDataURI' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M439"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M439"/>
   <xsl:template match="@*|node()" priority="-2" mode="M439">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M439"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeName]"
                 priority="1000"
                 mode="M440">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeName]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeName' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M440"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M440"/>
   <xsl:template match="@*|node()" priority="-2" mode="M440">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M440"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeURI]"
                 priority="1000"
                 mode="M441">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeURI]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeURI' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M441"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M441"/>
   <xsl:template match="@*|node()" priority="-2" mode="M441">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M441"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeVersionID]"
                 priority="1000"
                 mode="M442">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID[@schemeVersionID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeVersionID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M442"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M442"/>
   <xsl:template match="@*|node()" priority="-2" mode="M442">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M442"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity"
                 priority="1000"
                 mode="M443">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:PartyLegalEntity' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M443"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M443"/>
   <xsl:template match="@*|node()" priority="-2" mode="M443">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M443"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyName/cbc:Name[@languageID]"
                 priority="1000"
                 mode="M444">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyName/cbc:Name[@languageID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @languageID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M444"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M444"/>
   <xsl:template match="@*|node()" priority="-2" mode="M444">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M444"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyName/cbc:Name[@languageLocaleID]"
                 priority="1000"
                 mode="M445">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyName/cbc:Name[@languageLocaleID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @languageLocaleID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M445"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M445"/>
   <xsl:template match="@*|node()" priority="-2" mode="M445">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M445"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyTaxScheme"
                 priority="1000"
                 mode="M446">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyTaxScheme"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:PartyTaxScheme' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M446"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M446"/>
   <xsl:template match="@*|node()" priority="-2" mode="M446">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M446"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Person"
                 priority="1000"
                 mode="M447">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Person"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:Person' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M447"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M447"/>
   <xsl:template match="@*|node()" priority="-2" mode="M447">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M447"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation"
                 priority="1000"
                 mode="M448">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:PhysicalLocation' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M448"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M448"/>
   <xsl:template match="@*|node()" priority="-2" mode="M448">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M448"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress"
                 priority="1000"
                 mode="M449">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:PostalAddress' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M449"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M449"/>
   <xsl:template match="@*|node()" priority="-2" mode="M449">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M449"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PowerOfAttorney"
                 priority="1000"
                 mode="M450">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PowerOfAttorney"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:PowerOfAttorney' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M450"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M450"/>
   <xsl:template match="@*|node()" priority="-2" mode="M450">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M450"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:ServiceProviderParty"
                 priority="1000"
                 mode="M451">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:ServiceProviderParty"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:ServiceProviderParty' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M451"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M451"/>
   <xsl:template match="@*|node()" priority="-2" mode="M451">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M451"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:EndpointID"
                 priority="1000"
                 mode="M452">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:EndpointID"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="@schemeID"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="@schemeID">
               <xsl:attribute name="id">PEPPOL_CORE_R001</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute '@schemeID' is required in this context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M452"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M452"/>
   <xsl:template match="@*|node()" priority="-2" mode="M452">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M452"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:EndpointID[@schemeAgencyID]"
                 priority="1000"
                 mode="M453">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:EndpointID[@schemeAgencyID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeAgencyID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M453"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M453"/>
   <xsl:template match="@*|node()" priority="-2" mode="M453">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M453"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:EndpointID[@schemeAgencyName]"
                 priority="1000"
                 mode="M454">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:EndpointID[@schemeAgencyName]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeAgencyName' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M454"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M454"/>
   <xsl:template match="@*|node()" priority="-2" mode="M454">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M454"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:EndpointID[@schemeDataURI]"
                 priority="1000"
                 mode="M455">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:EndpointID[@schemeDataURI]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeDataURI' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M455"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M455"/>
   <xsl:template match="@*|node()" priority="-2" mode="M455">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M455"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:EndpointID[@schemeName]"
                 priority="1000"
                 mode="M456">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:EndpointID[@schemeName]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeName' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M456"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M456"/>
   <xsl:template match="@*|node()" priority="-2" mode="M456">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M456"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:EndpointID[@schemeURI]"
                 priority="1000"
                 mode="M457">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:EndpointID[@schemeURI]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeURI' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M457"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M457"/>
   <xsl:template match="@*|node()" priority="-2" mode="M457">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M457"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:EndpointID[@schemeVersionID]"
                 priority="1000"
                 mode="M458">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:EndpointID[@schemeVersionID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeVersionID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M458"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M458"/>
   <xsl:template match="@*|node()" priority="-2" mode="M458">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M458"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:IndustryClassificationCode"
                 priority="1000"
                 mode="M459">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:IndustryClassificationCode"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:IndustryClassificationCode' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M459"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M459"/>
   <xsl:template match="@*|node()" priority="-2" mode="M459">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M459"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:LogoReferenceID"
                 priority="1000"
                 mode="M460">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:LogoReferenceID"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:LogoReferenceID' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M460"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M460"/>
   <xsl:template match="@*|node()" priority="-2" mode="M460">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M460"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:MarkAttentionIndicator"
                 priority="1000"
                 mode="M461">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:MarkAttentionIndicator"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:MarkAttentionIndicator' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M461"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M461"/>
   <xsl:template match="@*|node()" priority="-2" mode="M461">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M461"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:MarkCareIndicator"
                 priority="1000"
                 mode="M462">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:MarkCareIndicator"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:MarkCareIndicator' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M462"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M462"/>
   <xsl:template match="@*|node()" priority="-2" mode="M462">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M462"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:WebsiteURI"
                 priority="1000"
                 mode="M463">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:WebsiteURI"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:WebsiteURI' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M463"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M463"/>
   <xsl:template match="@*|node()" priority="-2" mode="M463">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M463"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:SellerSupplierParty/cac:SellerContact"
                 priority="1000"
                 mode="M464">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:SellerSupplierParty/cac:SellerContact"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:SellerContact' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M464"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M464"/>
   <xsl:template match="@*|node()" priority="-2" mode="M464">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M464"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:SellerSupplierParty/cbc:AdditionalAccountID"
                 priority="1000"
                 mode="M465">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:SellerSupplierParty/cbc:AdditionalAccountID"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:AdditionalAccountID' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M465"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M465"/>
   <xsl:template match="@*|node()" priority="-2" mode="M465">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M465"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:SellerSupplierParty/cbc:CustomerAssignedAccountID"
                 priority="1000"
                 mode="M466">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:SellerSupplierParty/cbc:CustomerAssignedAccountID"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:CustomerAssignedAccountID' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M466"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M466"/>
   <xsl:template match="@*|node()" priority="-2" mode="M466">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M466"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:SellerSupplierParty/cbc:DataSendingCapability"
                 priority="1000"
                 mode="M467">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:SellerSupplierParty/cbc:DataSendingCapability"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:DataSendingCapability' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M467"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M467"/>
   <xsl:template match="@*|node()" priority="-2" mode="M467">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M467"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:Signature" priority="1000" mode="M468">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:Signature"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:Signature' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M468"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M468"/>
   <xsl:template match="@*|node()" priority="-2" mode="M468">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M468"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:TaxExchangeRate"
                 priority="1000"
                 mode="M469">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:TaxExchangeRate"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:TaxExchangeRate' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M469"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M469"/>
   <xsl:template match="@*|node()" priority="-2" mode="M469">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M469"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:TaxTotal" priority="1000" mode="M470">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:TaxTotal"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:TaxTotal' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M470"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M470"/>
   <xsl:template match="@*|node()" priority="-2" mode="M470">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M470"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:TransactionConditions"
                 priority="1000"
                 mode="M471">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:TransactionConditions"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:TransactionConditions' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M471"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M471"/>
   <xsl:template match="@*|node()" priority="-2" mode="M471">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M471"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cac:ValidityPeriod"
                 priority="1000"
                 mode="M472">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cac:ValidityPeriod"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cac:ValidityPeriod' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M472"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M472"/>
   <xsl:template match="@*|node()" priority="-2" mode="M472">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M472"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:AccountingCost"
                 priority="1000"
                 mode="M473">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:AccountingCost"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:AccountingCost' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M473"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M473"/>
   <xsl:template match="@*|node()" priority="-2" mode="M473">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M473"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:AccountingCostCode"
                 priority="1000"
                 mode="M474">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:AccountingCostCode"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:AccountingCostCode' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M474"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M474"/>
   <xsl:template match="@*|node()" priority="-2" mode="M474">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M474"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:CopyIndicator"
                 priority="1000"
                 mode="M475">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:CopyIndicator"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:CopyIndicator' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M475"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M475"/>
   <xsl:template match="@*|node()" priority="-2" mode="M475">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M475"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:CustomerReference"
                 priority="1000"
                 mode="M476">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:CustomerReference"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:CustomerReference' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M476"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M476"/>
   <xsl:template match="@*|node()" priority="-2" mode="M476">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M476"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:CustomizationID[@schemeAgencyID]"
                 priority="1000"
                 mode="M477">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:CustomizationID[@schemeAgencyID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeAgencyID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M477"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M477"/>
   <xsl:template match="@*|node()" priority="-2" mode="M477">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M477"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:CustomizationID[@schemeAgencyName]"
                 priority="1000"
                 mode="M478">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:CustomizationID[@schemeAgencyName]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeAgencyName' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M478"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M478"/>
   <xsl:template match="@*|node()" priority="-2" mode="M478">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M478"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:CustomizationID[@schemeDataURI]"
                 priority="1000"
                 mode="M479">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:CustomizationID[@schemeDataURI]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeDataURI' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M479"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M479"/>
   <xsl:template match="@*|node()" priority="-2" mode="M479">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M479"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:CustomizationID[@schemeID]"
                 priority="1000"
                 mode="M480">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:CustomizationID[@schemeID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M480"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M480"/>
   <xsl:template match="@*|node()" priority="-2" mode="M480">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M480"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:CustomizationID[@schemeName]"
                 priority="1000"
                 mode="M481">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:CustomizationID[@schemeName]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeName' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M481"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M481"/>
   <xsl:template match="@*|node()" priority="-2" mode="M481">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M481"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:CustomizationID[@schemeURI]"
                 priority="1000"
                 mode="M482">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:CustomizationID[@schemeURI]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeURI' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M482"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M482"/>
   <xsl:template match="@*|node()" priority="-2" mode="M482">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M482"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:CustomizationID[@schemeVersionID]"
                 priority="1000"
                 mode="M483">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:CustomizationID[@schemeVersionID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeVersionID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M483"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M483"/>
   <xsl:template match="@*|node()" priority="-2" mode="M483">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M483"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:DocumentCurrencyCode"
                 priority="1000"
                 mode="M484">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:DocumentCurrencyCode"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="@listID"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="@listID">
               <xsl:attribute name="id">PEPPOL_CORE_R001</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute '@listID' is required in this context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M484"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M484"/>
   <xsl:template match="@*|node()" priority="-2" mode="M484">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M484"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:DocumentCurrencyCode[@languageID]"
                 priority="1000"
                 mode="M485">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:DocumentCurrencyCode[@languageID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @languageID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M485"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M485"/>
   <xsl:template match="@*|node()" priority="-2" mode="M485">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M485"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:DocumentCurrencyCode[@listAgencyID]"
                 priority="1000"
                 mode="M486">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:DocumentCurrencyCode[@listAgencyID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @listAgencyID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M486"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M486"/>
   <xsl:template match="@*|node()" priority="-2" mode="M486">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M486"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:DocumentCurrencyCode[@listAgencyName]"
                 priority="1000"
                 mode="M487">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:DocumentCurrencyCode[@listAgencyName]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @listAgencyName' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M487"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M487"/>
   <xsl:template match="@*|node()" priority="-2" mode="M487">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M487"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:DocumentCurrencyCode[@listName]"
                 priority="1000"
                 mode="M488">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:DocumentCurrencyCode[@listName]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @listName' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M488"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M488"/>
   <xsl:template match="@*|node()" priority="-2" mode="M488">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M488"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:DocumentCurrencyCode[@listSchemeURI]"
                 priority="1000"
                 mode="M489">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:DocumentCurrencyCode[@listSchemeURI]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @listSchemeURI' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M489"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M489"/>
   <xsl:template match="@*|node()" priority="-2" mode="M489">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M489"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:DocumentCurrencyCode[@listURI]"
                 priority="1000"
                 mode="M490">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:DocumentCurrencyCode[@listURI]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @listURI' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M490"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M490"/>
   <xsl:template match="@*|node()" priority="-2" mode="M490">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M490"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:DocumentCurrencyCode[@listVersionID]"
                 priority="1000"
                 mode="M491">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:DocumentCurrencyCode[@listVersionID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @listVersionID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M491"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M491"/>
   <xsl:template match="@*|node()" priority="-2" mode="M491">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M491"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:DocumentCurrencyCode[@name]"
                 priority="1000"
                 mode="M492">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:DocumentCurrencyCode[@name]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @name' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M492"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M492"/>
   <xsl:template match="@*|node()" priority="-2" mode="M492">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M492"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:GrossVolumeMeasure"
                 priority="1000"
                 mode="M493">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:GrossVolumeMeasure"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:GrossVolumeMeasure' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M493"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M493"/>
   <xsl:template match="@*|node()" priority="-2" mode="M493">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M493"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:GrossWeightMeasure"
                 priority="1000"
                 mode="M494">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:GrossWeightMeasure"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:GrossWeightMeasure' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M494"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M494"/>
   <xsl:template match="@*|node()" priority="-2" mode="M494">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M494"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:ID[@schemeAgencyID]"
                 priority="1000"
                 mode="M495">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:ID[@schemeAgencyID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeAgencyID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M495"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M495"/>
   <xsl:template match="@*|node()" priority="-2" mode="M495">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M495"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:ID[@schemeAgencyName]"
                 priority="1000"
                 mode="M496">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:ID[@schemeAgencyName]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeAgencyName' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M496"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M496"/>
   <xsl:template match="@*|node()" priority="-2" mode="M496">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M496"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:ID[@schemeDataURI]"
                 priority="1000"
                 mode="M497">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:ID[@schemeDataURI]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeDataURI' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M497"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M497"/>
   <xsl:template match="@*|node()" priority="-2" mode="M497">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M497"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:ID[@schemeID]"
                 priority="1000"
                 mode="M498">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:ID[@schemeID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M498"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M498"/>
   <xsl:template match="@*|node()" priority="-2" mode="M498">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M498"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:ID[@schemeName]"
                 priority="1000"
                 mode="M499">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:ID[@schemeName]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeName' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M499"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M499"/>
   <xsl:template match="@*|node()" priority="-2" mode="M499">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M499"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:ID[@schemeURI]"
                 priority="1000"
                 mode="M500">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:ID[@schemeURI]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeURI' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M500"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M500"/>
   <xsl:template match="@*|node()" priority="-2" mode="M500">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M500"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:ID[@schemeVersionID]"
                 priority="1000"
                 mode="M501">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:ID[@schemeVersionID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeVersionID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M501"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M501"/>
   <xsl:template match="@*|node()" priority="-2" mode="M501">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M501"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:LineCountNumeric"
                 priority="1000"
                 mode="M502">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:LineCountNumeric"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:LineCountNumeric' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M502"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M502"/>
   <xsl:template match="@*|node()" priority="-2" mode="M502">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M502"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:NetNetWeightMeasure"
                 priority="1000"
                 mode="M503">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:NetNetWeightMeasure"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:NetNetWeightMeasure' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M503"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M503"/>
   <xsl:template match="@*|node()" priority="-2" mode="M503">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M503"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:NetVolumeMeasure"
                 priority="1000"
                 mode="M504">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:NetVolumeMeasure"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:NetVolumeMeasure' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M504"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M504"/>
   <xsl:template match="@*|node()" priority="-2" mode="M504">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M504"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:NetWeightMeasure"
                 priority="1000"
                 mode="M505">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:NetWeightMeasure"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:NetWeightMeasure' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M505"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M505"/>
   <xsl:template match="@*|node()" priority="-2" mode="M505">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M505"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:Note[@languageID]"
                 priority="1000"
                 mode="M506">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:Note[@languageID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @languageID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M506"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M506"/>
   <xsl:template match="@*|node()" priority="-2" mode="M506">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M506"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:Note[@languageLocaleID]"
                 priority="1000"
                 mode="M507">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:Note[@languageLocaleID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @languageLocaleID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M507"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M507"/>
   <xsl:template match="@*|node()" priority="-2" mode="M507">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M507"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:OrderResponseCode"
                 priority="1000"
                 mode="M508">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:OrderResponseCode"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="@listID"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="@listID">
               <xsl:attribute name="id">PEPPOL_CORE_R001</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute '@listID' is required in this context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M508"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M508"/>
   <xsl:template match="@*|node()" priority="-2" mode="M508">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M508"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:OrderResponseCode[@languageID]"
                 priority="1000"
                 mode="M509">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:OrderResponseCode[@languageID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @languageID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M509"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M509"/>
   <xsl:template match="@*|node()" priority="-2" mode="M509">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M509"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:OrderResponseCode[@listAgencyID]"
                 priority="1000"
                 mode="M510">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:OrderResponseCode[@listAgencyID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @listAgencyID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M510"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M510"/>
   <xsl:template match="@*|node()" priority="-2" mode="M510">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M510"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:OrderResponseCode[@listAgencyName]"
                 priority="1000"
                 mode="M511">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:OrderResponseCode[@listAgencyName]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @listAgencyName' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M511"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M511"/>
   <xsl:template match="@*|node()" priority="-2" mode="M511">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M511"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:OrderResponseCode[@listName]"
                 priority="1000"
                 mode="M512">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:OrderResponseCode[@listName]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @listName' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M512"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M512"/>
   <xsl:template match="@*|node()" priority="-2" mode="M512">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M512"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:OrderResponseCode[@listSchemeURI]"
                 priority="1000"
                 mode="M513">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:OrderResponseCode[@listSchemeURI]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @listSchemeURI' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M513"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M513"/>
   <xsl:template match="@*|node()" priority="-2" mode="M513">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M513"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:OrderResponseCode[@listURI]"
                 priority="1000"
                 mode="M514">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:OrderResponseCode[@listURI]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @listURI' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M514"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M514"/>
   <xsl:template match="@*|node()" priority="-2" mode="M514">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M514"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:OrderResponseCode[@listVersionID]"
                 priority="1000"
                 mode="M515">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:OrderResponseCode[@listVersionID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @listVersionID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M515"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M515"/>
   <xsl:template match="@*|node()" priority="-2" mode="M515">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M515"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:OrderResponseCode[@name]"
                 priority="1000"
                 mode="M516">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:OrderResponseCode[@name]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @name' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M516"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M516"/>
   <xsl:template match="@*|node()" priority="-2" mode="M516">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M516"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:PricingCurrencyCode"
                 priority="1000"
                 mode="M517">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:PricingCurrencyCode"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:PricingCurrencyCode' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M517"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M517"/>
   <xsl:template match="@*|node()" priority="-2" mode="M517">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M517"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:ProfileExecutionID"
                 priority="1000"
                 mode="M518">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:ProfileExecutionID"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:ProfileExecutionID' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M518"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M518"/>
   <xsl:template match="@*|node()" priority="-2" mode="M518">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M518"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:ProfileID[@schemeAgencyID]"
                 priority="1000"
                 mode="M519">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:ProfileID[@schemeAgencyID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeAgencyID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M519"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M519"/>
   <xsl:template match="@*|node()" priority="-2" mode="M519">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M519"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:ProfileID[@schemeAgencyName]"
                 priority="1000"
                 mode="M520">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:ProfileID[@schemeAgencyName]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeAgencyName' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M520"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M520"/>
   <xsl:template match="@*|node()" priority="-2" mode="M520">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M520"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:ProfileID[@schemeDataURI]"
                 priority="1000"
                 mode="M521">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:ProfileID[@schemeDataURI]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeDataURI' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M521"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M521"/>
   <xsl:template match="@*|node()" priority="-2" mode="M521">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M521"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:ProfileID[@schemeID]"
                 priority="1000"
                 mode="M522">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:ProfileID[@schemeID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M522"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M522"/>
   <xsl:template match="@*|node()" priority="-2" mode="M522">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M522"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:ProfileID[@schemeName]"
                 priority="1000"
                 mode="M523">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:ProfileID[@schemeName]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeName' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M523"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M523"/>
   <xsl:template match="@*|node()" priority="-2" mode="M523">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M523"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:ProfileID[@schemeURI]"
                 priority="1000"
                 mode="M524">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:ProfileID[@schemeURI]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeURI' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M524"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M524"/>
   <xsl:template match="@*|node()" priority="-2" mode="M524">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M524"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:ProfileID[@schemeVersionID]"
                 priority="1000"
                 mode="M525">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:ProfileID[@schemeVersionID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeVersionID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M525"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M525"/>
   <xsl:template match="@*|node()" priority="-2" mode="M525">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M525"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:SalesOrderID"
                 priority="1000"
                 mode="M526">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:SalesOrderID"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:SalesOrderID' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M526"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M526"/>
   <xsl:template match="@*|node()" priority="-2" mode="M526">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M526"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:TaxCurrencyCode"
                 priority="1000"
                 mode="M527">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:TaxCurrencyCode"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:TaxCurrencyCode' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M527"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M527"/>
   <xsl:template match="@*|node()" priority="-2" mode="M527">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M527"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:TotalPackagesQuantity"
                 priority="1000"
                 mode="M528">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:TotalPackagesQuantity"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:TotalPackagesQuantity' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M528"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M528"/>
   <xsl:template match="@*|node()" priority="-2" mode="M528">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M528"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:UBLVersionID[@schemeAgencyID]"
                 priority="1000"
                 mode="M529">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:UBLVersionID[@schemeAgencyID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeAgencyID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M529"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M529"/>
   <xsl:template match="@*|node()" priority="-2" mode="M529">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M529"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:UBLVersionID[@schemeAgencyName]"
                 priority="1000"
                 mode="M530">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:UBLVersionID[@schemeAgencyName]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeAgencyName' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M530"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M530"/>
   <xsl:template match="@*|node()" priority="-2" mode="M530">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M530"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:UBLVersionID[@schemeDataURI]"
                 priority="1000"
                 mode="M531">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:UBLVersionID[@schemeDataURI]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeDataURI' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M531"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M531"/>
   <xsl:template match="@*|node()" priority="-2" mode="M531">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M531"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:UBLVersionID[@schemeID]"
                 priority="1000"
                 mode="M532">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:UBLVersionID[@schemeID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M532"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M532"/>
   <xsl:template match="@*|node()" priority="-2" mode="M532">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M532"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:UBLVersionID[@schemeName]"
                 priority="1000"
                 mode="M533">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:UBLVersionID[@schemeName]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeName' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M533"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M533"/>
   <xsl:template match="@*|node()" priority="-2" mode="M533">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M533"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:UBLVersionID[@schemeURI]"
                 priority="1000"
                 mode="M534">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:UBLVersionID[@schemeURI]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeURI' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M534"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M534"/>
   <xsl:template match="@*|node()" priority="-2" mode="M534">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M534"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:UBLVersionID[@schemeVersionID]"
                 priority="1000"
                 mode="M535">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:UBLVersionID[@schemeVersionID]"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Attribute @schemeVersionID' marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M535"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M535"/>
   <xsl:template match="@*|node()" priority="-2" mode="M535">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M535"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/cbc:UUID" priority="1000" mode="M536">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/cbc:UUID"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'cbc:UUID' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M536"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M536"/>
   <xsl:template match="@*|node()" priority="-2" mode="M536">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M536"/>
   </xsl:template>

   <!--PATTERN -->


	  <!--RULE -->
   <xsl:template match="/p1:OrderResponse/ext:UBLExtensions"
                 priority="1000"
                 mode="M537">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="/p1:OrderResponse/ext:UBLExtensions"/>

		    <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="false()"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" test="false()">
               <xsl:attribute name="id">PEPPOL_CORE_R002</xsl:attribute>
               <xsl:attribute name="flag">warning</xsl:attribute>
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
	Element 'ext:UBLExtensions' is marked as not used in the given context.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M537"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M537"/>
   <xsl:template match="@*|node()" priority="-2" mode="M537">
      <xsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M537"/>
   </xsl:template>
</xsl:stylesheet>
