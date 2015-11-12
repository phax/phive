<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet version="1.0" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:cec="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:ubl="urn:oasis:names:specification:ubl:schema:xsd:DespatchAdvice-2" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
    <svrl:schematron-output schemaVersion="" title="BIIRULES T16 bound to UBL">
      <xsl:comment>
        <xsl:value-of select="$archiveDirParameter" />   
		 <xsl:value-of select="$archiveNameParameter" />  
		 <xsl:value-of select="$fileNameParameter" />  
		 <xsl:value-of select="$fileDirParameter" />
      </xsl:comment>
      <svrl:ns-prefix-in-attribute-values prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" />
      <svrl:ns-prefix-in-attribute-values prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" />
      <svrl:ns-prefix-in-attribute-values prefix="cec" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" />
      <svrl:ns-prefix-in-attribute-values prefix="xs" uri="http://www.w3.org/2001/XMLSchema" />
      <svrl:ns-prefix-in-attribute-values prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:DespatchAdvice-2" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:attribute name="id">UBL-T16</xsl:attribute>
        <xsl:attribute name="name">UBL-T16</xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M7" select="/" />
    </svrl:schematron-output>
  </xsl:template>

<!--SCHEMATRON PATTERNS-->
<svrl:text>BIIRULES T16 bound to UBL</svrl:text>

<!--PATTERN UBL-T16-->


	<!--RULE -->
<xsl:template match="//cac:DeliveryCustomerParty" mode="M7" priority="1005">
    <svrl:fired-rule context="//cac:DeliveryCustomerParty" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(cac:Party/cac:PartyName/cbc:Name) or (cac:Party/cac:PartyIdentification/cbc:ID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="(cac:Party/cac:PartyName/cbc:Name) or (cac:Party/cac:PartyIdentification/cbc:ID)">
          <xsl:attribute name="id">BII2-T16-R009</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T16-R009]-A consignee party SHOULD have the party name or a party identifier</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M7" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="//cac:Item" mode="M7" priority="1004">
    <svrl:fired-rule context="//cac:Item" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(//cac:StandardItemIdentification/cbc:ID/@schemeID) or not(//cac:StandardItemIdentification)" />
      <xsl:otherwise>
        <svrl:failed-assert test="(//cac:StandardItemIdentification/cbc:ID/@schemeID) or not(//cac:StandardItemIdentification)">
          <xsl:attribute name="id">BII2-T16-R018</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T16-R018]-An item standard identifier MUST have an identification schema (e.g. GTIN)</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M7" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:DespatchAdvice" mode="M7" priority="1003">
    <svrl:fired-rule context="/ubl:DespatchAdvice" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(cbc:CustomizationID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="(cbc:CustomizationID)">
          <xsl:attribute name="id">BII2-T16-R001</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T16-R001]-A despatch advice MUST have a customization identifier</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(cbc:ProfileID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="(cbc:ProfileID)">
          <xsl:attribute name="id">BII2-T16-R002</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T16-R002]-A despatch advice MUST have a profile identifier</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(cbc:ID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="(cbc:ID)">
          <xsl:attribute name="id">BII2-T16-R003</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T16-R003]-A despatch advice MUST have a document identifier</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(cbc:IssueDate)" />
      <xsl:otherwise>
        <svrl:failed-assert test="(cbc:IssueDate)">
          <xsl:attribute name="id">BII2-T16-R004</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T16-R004]-A despatch advice MUST have a document issue date</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(cac:OrderReference/cbc:ID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="(cac:OrderReference/cbc:ID)">
          <xsl:attribute name="id">BII2-T16-R005</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T16-R005]-A despatch advice SHOULD have an order identifier</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(cac:DespatchSupplierParty)" />
      <xsl:otherwise>
        <svrl:failed-assert test="(cac:DespatchSupplierParty)">
          <xsl:attribute name="id">BII2-T16-R006</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T16-R006]-A despatch advice MUST have a despatching party</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(cac:DeliveryCustomerParty)" />
      <xsl:otherwise>
        <svrl:failed-assert test="(cac:DeliveryCustomerParty)">
          <xsl:attribute name="id">BII2-T16-R008</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T16-R008]-A despatch advice MUST have a consignee party</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(cac:DespatchLine)" />
      <xsl:otherwise>
        <svrl:failed-assert test="(cac:DespatchLine)">
          <xsl:attribute name="id">BII2-T16-R012</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T16-R012]-A despatch advice MUST have at least one despatch advice line</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M7" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="//cac:DespatchLine" mode="M7" priority="1002">
    <svrl:fired-rule context="//cac:DespatchLine" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(cbc:ID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="(cbc:ID)">
          <xsl:attribute name="id">BII2-T16-R013</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T16-R013]-Each despatch advice line MUST have a despatch line identifier that is unique within the despatch advice</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(cac:Item/cbc:Name) or (cac:Item/cac:StandardItemIdentification/cbc:ID) or  (cac:Item/cac:SellersItemIdentification/cbc:ID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="(cac:Item/cbc:Name) or (cac:Item/cac:StandardItemIdentification/cbc:ID) or (cac:Item/cac:SellersItemIdentification/cbc:ID)">
          <xsl:attribute name="id">BII2-T16-R016</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T16-R016]-Each despatch advice line MUST have an item identifier and/or an item name</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(cbc:DeliveredQuantity)" />
      <xsl:otherwise>
        <svrl:failed-assert test="(cbc:DeliveredQuantity)">
          <xsl:attribute name="id">BII2-T16-R017</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T16-R017]-Each despatch advice line SHOULD have a delivered quantity</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(cbc:DeliveredQuantity) >= 0" />
      <xsl:otherwise>
        <svrl:failed-assert test="(cbc:DeliveredQuantity) >= 0">
          <xsl:attribute name="id">BII2-T16-R019</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T16-R019]-Each despatch advice line delivered quantity MUST not be negative</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(cbc:DeliveredQuantity/@unitCode)" />
      <xsl:otherwise>
        <svrl:failed-assert test="(cbc:DeliveredQuantity/@unitCode)">
          <xsl:attribute name="id">BII2-T16-R020</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T16-R020]-Each despatch advice line delivered quantity  SHOULD have an associated unit of measure</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="((cbc:OutstandingQuantity) and (cbc:OutstandingReason)) or not(cbc:OutstandingQuantity)" />
      <xsl:otherwise>
        <svrl:failed-assert test="((cbc:OutstandingQuantity) and (cbc:OutstandingReason)) or not(cbc:OutstandingQuantity)">
          <xsl:attribute name="id">BII2-T16-R021</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T16-R021]-An outstanding quantity reason SHOULD be provided if the despatch line contains an outstanding quantity</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M7" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="//cac:Shipment" mode="M7" priority="1001">
    <svrl:fired-rule context="//cac:Shipment" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(cbc:ID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="(cbc:ID)">
          <xsl:attribute name="id">BII2-T16-R011</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T16-R011]-Shipment identifier MUST be provided if the despatch advice contains shipment information</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M7" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="//cac:DespatchSupplierParty" mode="M7" priority="1000">
    <svrl:fired-rule context="//cac:DespatchSupplierParty" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(cac:Party/cac:PartyName/cbc:Name)" />
      <xsl:otherwise>
        <svrl:failed-assert test="(cac:Party/cac:PartyName/cbc:Name)">
          <xsl:attribute name="id">BII2-T16-R007</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T16-R007]-A despatching party SHOULD have the despatching party name</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M7" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M7" priority="-1" />
  <xsl:template match="@*|node()" mode="M7" priority="-2">
    <xsl:apply-templates mode="M7" select="*|comment()|processing-instruction()" />
  </xsl:template>
</xsl:stylesheet>
