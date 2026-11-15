<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<xsl:stylesheet xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:p1="http://www.unece.org/cefact/namespaces/StandardBusinessDocumentHeader" xmlns:saxon="http://saxon.sf.net/" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:ubl-creditnote="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:ubl-invoice="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <!-- Created with ph-schematron version of ISO Schematron XSLTs. -->
<!-- Implementers: please note that overriding process-prolog or process-root is 
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
    <xsl:variable name="preceding" select="count(preceding-sibling::*[local-name()=local-name(current())                                       and namespace-uri() = namespace-uri(current())])" />
    <xsl:text>[</xsl:text>
    <xsl:value-of select="1 + $preceding" />
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
  <!--Strip characters-->
  <xsl:template match="text()" priority="-1" />

<!--SCHEMA SETUP-->
<xsl:template match="/">
    <svrl:schematron-output schemaVersion="iso" title="Compliance rules for OpenPeppol Business Message Envelope (SBDH) enveloping Peppol BIS BILLING 3.0">
      <xsl:comment>
        <xsl:value-of select="$archiveDirParameter" />   
		 <xsl:value-of select="$archiveNameParameter" />  
		 <xsl:value-of select="$fileNameParameter" />  
		 <xsl:value-of select="$fileDirParameter" />
      </xsl:comment>
      <svrl:ns-prefix-in-attribute-values prefix="p1" uri="http://www.unece.org/cefact/namespaces/StandardBusinessDocumentHeader" />
      <svrl:ns-prefix-in-attribute-values prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" />
      <svrl:ns-prefix-in-attribute-values prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" />
      <svrl:ns-prefix-in-attribute-values prefix="ubl-creditnote" uri="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" />
      <svrl:ns-prefix-in-attribute-values prefix="ubl-invoice" uri="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" />
      <svrl:active-pattern>
        <xsl:attribute name="documents">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
      </svrl:active-pattern>
      <xsl:apply-templates mode="M10" select="/" />
    </svrl:schematron-output>
  </xsl:template>

<!--SCHEMATRON PATTERNS-->
<svrl:text>Compliance rules for OpenPeppol Business Message Envelope (SBDH) enveloping Peppol BIS BILLING 3.0</svrl:text>
  <xsl:param name="customizationID" select="normalize-space(/p1:StandardBusinessDocument/*/cbc:CustomizationID)" />
  <xsl:param name="profileID" select="normalize-space(/p1:StandardBusinessDocument/*/cbc:ProfileID)" />
  <xsl:param name="isBilling" select="       ($customizationID = 'urn:cen.eu:en16931:2017#compliant#urn:fdc:peppol.eu:2017:poacc:billing:3.0' and        $profileID       = 'urn:fdc:peppol.eu:2017:poacc:billing:01:1.0')       or       ($customizationID = 'urn:cen.eu:en16931:2017#compliant#urn:fdc:peppol.eu:2017:poacc:billing:3.0' and        $profileID       = 'urn:peppol:bis:billing_with_response')   " />
  <xsl:param name="isSelfBilling" select="       $customizationID = 'urn:cen.eu:en16931:2017#compliant#urn:fdc:peppol.eu:2017:poacc:selfbilling:3.0' and       $profileID       = 'urn:fdc:peppol.eu:2017:poacc:selfbilling:01:1.0'   " />

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/p1:StandardBusinessDocument/p1:StandardBusinessDocumentHeader/p1:Receiver/p1:Identifier[$isBilling and not($isSelfBilling)]" mode="M10" priority="1003">
    <svrl:fired-rule context="/p1:StandardBusinessDocument/p1:StandardBusinessDocumentHeader/p1:Receiver/p1:Identifier[$isBilling and not($isSelfBilling)]" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test=". = concat(/p1:StandardBusinessDocument/*/cac:AccountingCustomerParty/cac:Party/cbc:EndpointID/@schemeID, ':', normalize-space(/p1:StandardBusinessDocument/*/cac:AccountingCustomerParty/cac:Party/cbc:EndpointID))" />
      <xsl:otherwise>
        <svrl:failed-assert test=". = concat(/p1:StandardBusinessDocument/*/cac:AccountingCustomerParty/cac:Party/cbc:EndpointID/@schemeID, ':', normalize-space(/p1:StandardBusinessDocument/*/cac:AccountingCustomerParty/cac:Party/cbc:EndpointID))">
          <xsl:attribute name="id">BR-SBDH-1</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>
		[BR-SBDH-1]-When a BIS Invoice or CreditNote message is enveloped, the value of the SBDH element Receiver/Identifier SHALL match the Party/EndpointID element value of the receiver party, including the value of its schemeID attribute.
      </svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/p1:StandardBusinessDocument/p1:StandardBusinessDocumentHeader/p1:Sender/p1:Identifier[$isBilling and not($isSelfBilling)]" mode="M10" priority="1002">
    <svrl:fired-rule context="/p1:StandardBusinessDocument/p1:StandardBusinessDocumentHeader/p1:Sender/p1:Identifier[$isBilling and not($isSelfBilling)]" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test=". = concat(/p1:StandardBusinessDocument/*/cac:AccountingSupplierParty/cac:Party/cbc:EndpointID/@schemeID, ':', normalize-space(/p1:StandardBusinessDocument/*/cac:AccountingSupplierParty/cac:Party/cbc:EndpointID))" />
      <xsl:otherwise>
        <svrl:failed-assert test=". = concat(/p1:StandardBusinessDocument/*/cac:AccountingSupplierParty/cac:Party/cbc:EndpointID/@schemeID, ':', normalize-space(/p1:StandardBusinessDocument/*/cac:AccountingSupplierParty/cac:Party/cbc:EndpointID))">
          <xsl:attribute name="id">BR-SBDH-2</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>
		[BR-SBDH-2]-When a BIS Invoice or CreditNote message is enveloped, the value of the SBDH element Sender/Identifier SHALL match the Party/EndpointID element value of the sender party, including the value of its schemeID attribute.
      </svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/p1:StandardBusinessDocument/p1:StandardBusinessDocumentHeader/p1:Receiver/p1:Identifier[$isSelfBilling]" mode="M10" priority="1001">
    <svrl:fired-rule context="/p1:StandardBusinessDocument/p1:StandardBusinessDocumentHeader/p1:Receiver/p1:Identifier[$isSelfBilling]" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test=". = concat(/p1:StandardBusinessDocument/*/cac:AccountingSupplierParty/cac:Party/cbc:EndpointID/@schemeID, ':', normalize-space(/p1:StandardBusinessDocument/*/cac:AccountingSupplierParty/cac:Party/cbc:EndpointID))" />
      <xsl:otherwise>
        <svrl:failed-assert test=". = concat(/p1:StandardBusinessDocument/*/cac:AccountingSupplierParty/cac:Party/cbc:EndpointID/@schemeID, ':', normalize-space(/p1:StandardBusinessDocument/*/cac:AccountingSupplierParty/cac:Party/cbc:EndpointID))">
          <xsl:attribute name="id">BR-SBDH-3</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>
		[BR-SBDH-3]-When a self-billing Invoice or CreditNote message is enveloped, the value of the SBDH element Receiver/Identifier SHALL match the AccountingSupplierParty/Party/EndpointID element value, including the value of its schemeID attribute.
      </svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/p1:StandardBusinessDocument/p1:StandardBusinessDocumentHeader/p1:Sender/p1:Identifier[$isSelfBilling]" mode="M10" priority="1000">
    <svrl:fired-rule context="/p1:StandardBusinessDocument/p1:StandardBusinessDocumentHeader/p1:Sender/p1:Identifier[$isSelfBilling]" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test=". = concat(/p1:StandardBusinessDocument/*/cac:AccountingCustomerParty/cac:Party/cbc:EndpointID/@schemeID, ':', normalize-space(/p1:StandardBusinessDocument/*/cac:AccountingCustomerParty/cac:Party/cbc:EndpointID))" />
      <xsl:otherwise>
        <svrl:failed-assert test=". = concat(/p1:StandardBusinessDocument/*/cac:AccountingCustomerParty/cac:Party/cbc:EndpointID/@schemeID, ':', normalize-space(/p1:StandardBusinessDocument/*/cac:AccountingCustomerParty/cac:Party/cbc:EndpointID))">
          <xsl:attribute name="id">BR-SBDH-4</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>
		[BR-SBDH-4]-When a self-billing Invoice or CreditNote message is enveloped, the value of the SBDH element Sender/Identifier SHALL match the AccountingCustomerParty/Party/EndpointID element value, including the value of its schemeID attribute.
      </svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*" />
  </xsl:template>
  <xsl:template match="text()" mode="M10" priority="-1" />
  <xsl:template match="@*|node()" mode="M10" priority="-2">
    <xsl:apply-templates mode="M10" select="*" />
  </xsl:template>
</xsl:stylesheet>
