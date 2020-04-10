<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:ubl="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" version="2.0">
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
    <svrl:schematron-output schemaVersion="" title="atgov-creditnote T14 bound to UBL">
      <xsl:comment>
        <xsl:value-of select="$archiveDirParameter" />   
		 <xsl:value-of select="$archiveNameParameter" />  
		 <xsl:value-of select="$fileNameParameter" />  
		 <xsl:value-of select="$fileDirParameter" />
      </xsl:comment>
      <svrl:ns-prefix-in-attribute-values prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" />
      <svrl:ns-prefix-in-attribute-values prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" />
      <svrl:ns-prefix-in-attribute-values prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:attribute name="id">UBL-T14</xsl:attribute>
        <xsl:attribute name="name">UBL-T14</xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M5" select="/" />
    </svrl:schematron-output>
  </xsl:template>

<!--SCHEMATRON PATTERNS-->
<svrl:text>atgov-creditnote T14 bound to UBL</svrl:text>

<!--PATTERN UBL-T14-->


	<!--RULE -->
<xsl:template match="/ubl:CreditNote/cac:AdditionalDocumentReference" mode="M5" priority="1005">
    <svrl:fired-rule context="/ubl:CreditNote/cac:AdditionalDocumentReference" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="((cac:Attachment/cbc:EmbeddedDocumentBinaryObject) and cac:Attachment/cbc:EmbeddedDocumentBinaryObject/@mimeCode = 'application/vnd.ms-excel' or cac:Attachment/cbc:EmbeddedDocumentBinaryObject/@mimeCode = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' or cac:Attachment/cbc:EmbeddedDocumentBinaryObject/@mimeCode = 'application/pdf' or cac:Attachment/cbc:EmbeddedDocumentBinaryObject/@mimeCode = 'image/png' or cac:Attachment/cbc:EmbeddedDocumentBinaryObject/@mimeCode = 'application/xml' or cac:Attachment/cbc:EmbeddedDocumentBinaryObject/@mimeCode = 'text/xml') or not ((cac:Attachment/cbc:EmbeddedDocumentBinaryObject))" />
      <xsl:otherwise>
        <svrl:failed-assert test="((cac:Attachment/cbc:EmbeddedDocumentBinaryObject) and cac:Attachment/cbc:EmbeddedDocumentBinaryObject/@mimeCode = 'application/vnd.ms-excel' or cac:Attachment/cbc:EmbeddedDocumentBinaryObject/@mimeCode = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' or cac:Attachment/cbc:EmbeddedDocumentBinaryObject/@mimeCode = 'application/pdf' or cac:Attachment/cbc:EmbeddedDocumentBinaryObject/@mimeCode = 'image/png' or cac:Attachment/cbc:EmbeddedDocumentBinaryObject/@mimeCode = 'application/xml' or cac:Attachment/cbc:EmbeddedDocumentBinaryObject/@mimeCode = 'text/xml') or not ((cac:Attachment/cbc:EmbeddedDocumentBinaryObject))">
          <xsl:attribute name="id">ATGOV-T14-R012</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[ATGOV-T14-R012]-Attachments included within the invoice must be of one of the following file formats: XLS (application/vnd.ms-excel), XLSX (application/vnd.openxmlformats-officedocument.spreadsheetml.sheet), PDF (application/pdf), PNG (image/png) or XML (application/xml or text/xml).</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:CreditNote" mode="M5" priority="1004">
    <svrl:fired-rule context="/ubl:CreditNote" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="count(cac:CreditNoteLine) &lt; 999" />
      <xsl:otherwise>
        <svrl:failed-assert test="count(cac:CreditNoteLine) &lt; 999">
          <xsl:attribute name="id">ATGOV-T14-R002</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[ATGOV-T14-R002]-A maximum number of 999 invoice lines must be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(cac:OrderReference/cbc:ID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="(cac:OrderReference/cbc:ID)">
          <xsl:attribute name="id">ATGOV-T14-R003</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[ATGOV-T14-R003]-The order number or buyer group must be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="count(cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:ID) = 1" />
      <xsl:otherwise>
        <svrl:failed-assert test="count(cac:PaymentMeans/cac:PayeeFinancialAccount/cbc:ID) = 1">
          <xsl:attribute name="id">ATGOV-T14-R005</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[ATGOV-T14-R005]-Exactly 1 beneficiary account may be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="count(cac:PaymentTerms/cac:SettlementPeriod) &lt;= 2" />
      <xsl:otherwise>
        <svrl:failed-assert test="count(cac:PaymentTerms/cac:SettlementPeriod) &lt;= 2">
          <xsl:attribute name="id">ATGOV-T14-R009</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[ATGOV-T14-R009]-At last 2 cashbacks may be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="count(cac:AdditionalDocumentReference/cac:Attachment/cbc:EmbeddedDocumentBinaryObject) &lt;= 200" />
      <xsl:otherwise>
        <svrl:failed-assert test="count(cac:AdditionalDocumentReference/cac:Attachment/cbc:EmbeddedDocumentBinaryObject) &lt;= 200">
          <xsl:attribute name="id">ATGOV-T14-R013</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[ATGOV-T14-R013]-A maximum of 200 attachments are allowed within a single document.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="string-length(string-join(cac:AdditionalDocumentReference/cac:Attachment/cbc:EmbeddedDocumentBinaryObject/text(),'')) * 3 div 4 &lt;= 15728640" />
      <xsl:otherwise>
        <svrl:failed-assert test="string-length(string-join(cac:AdditionalDocumentReference/cac:Attachment/cbc:EmbeddedDocumentBinaryObject/text(),'')) * 3 div 4 &lt;= 15728640">
          <xsl:attribute name="id">ATGOV-T14-R014</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[ATGOV-T14-R014]-The maximum size of all attachments after Base64 decoding must not exceed 15 Megabytes.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="number(cac:LegalMonetaryTotal/cbc:PayableAmount) &lt;= 999999999.99" />
      <xsl:otherwise>
        <svrl:failed-assert test="number(cac:LegalMonetaryTotal/cbc:PayableAmount) &lt;= 999999999.99">
          <xsl:attribute name="id">ATGOV-T14-R016</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[ATGOV-T14-R016]-The payable amount of an invoice must be smaller or equal than 999999999.99.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:CreditNote/cac:CreditNoteLine" mode="M5" priority="1003">
    <svrl:fired-rule context="/ubl:CreditNote/cac:CreditNoteLine" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="((string(number(//cac:OrderReference/cbc:ID)) != 'NaN') and (cac:OrderLineReference/cbc:LineID)) or not ((string(number(//cac:OrderReference/cbc:ID)) != 'NaN'))" />
      <xsl:otherwise>
        <svrl:failed-assert test="((string(number(//cac:OrderReference/cbc:ID)) != 'NaN') and (cac:OrderLineReference/cbc:LineID)) or not ((string(number(//cac:OrderReference/cbc:ID)) != 'NaN'))">
          <xsl:attribute name="id">ATGOV-T14-R008</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[ATGOV-T14-R008]-The order position number (per line item) must be present when the OrderID is a PO number (10 digit numeric).</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(number(cbc:LineExtensionAmount) >= -999999999999.99 and number(cbc:LineExtensionAmount) &lt;= 999999999999.99)" />
      <xsl:otherwise>
        <svrl:failed-assert test="(number(cbc:LineExtensionAmount) >= -999999999999.99 and number(cbc:LineExtensionAmount) &lt;= 999999999999.99)">
          <xsl:attribute name="id">ATGOV-T14-R015</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[ATGOV-T14-R015]-The gross amount of a single invoice line must be greater or equal than -999999999999.99 and smaller or equal than 999999999999.99.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="((cac:Price/cbc:PriceAmount) and matches(cac:Price/cbc:PriceAmount/text(),&quot;^[-+]?[0-9]*(\.[0-9]{0,4})?$&quot;)) or not ((cac:Price/cbc:PriceAmount))" />
      <xsl:otherwise>
        <svrl:failed-assert test="((cac:Price/cbc:PriceAmount) and matches(cac:Price/cbc:PriceAmount/text(),&quot;^[-+]?[0-9]*(\.[0-9]{0,4})?$&quot;)) or not ((cac:Price/cbc:PriceAmount))">
          <xsl:attribute name="id">ATGOV-T14-R018</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[ATGOV-T14-R018]-The unit net amount of a line may have at most 4 fraction digits</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:CreditNote/cac:PaymentMeans" mode="M5" priority="1002">
    <svrl:fired-rule context="/ubl:CreditNote/cac:PaymentMeans" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(cbc:PaymentMeansCode = '30' or cbc:PaymentMeansCode = '31' or cbc:PaymentMeansCode = '42'  or cbc:PaymentMeansCode = '49' or cbc:PaymentMeansCode = '58' or cbc:PaymentMeansCode = '59') and  (cac:PayeeFinancialAccount/cbc:ID/@schemeID and cac:PayeeFinancialAccount/cbc:ID/@schemeID = 'IBAN') and  (cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cbc:ID/@schemeID and cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cbc:ID/@schemeID = 'BIC')" />
      <xsl:otherwise>
        <svrl:failed-assert test="(cbc:PaymentMeansCode = '30' or cbc:PaymentMeansCode = '31' or cbc:PaymentMeansCode = '42' or cbc:PaymentMeansCode = '49' or cbc:PaymentMeansCode = '58' or cbc:PaymentMeansCode = '59') and (cac:PayeeFinancialAccount/cbc:ID/@schemeID and cac:PayeeFinancialAccount/cbc:ID/@schemeID = 'IBAN') and (cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cbc:ID/@schemeID and cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cbc:ID/@schemeID = 'BIC')">
          <xsl:attribute name="id">ATGOV-T14-R007</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[ATGOV-T14-R007]-Only valid BICs and IBANs are allowed as beneficiary account information.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:CreditNote/cac:PaymentTerms" mode="M5" priority="1001">
    <svrl:fired-rule context="/ubl:CreditNote/cac:PaymentTerms" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="((cbc:Note) and cbc:SettlementDiscountPercent and cac:SettlementPeriod) or not ((cbc:Note))" />
      <xsl:otherwise>
        <svrl:failed-assert test="((cbc:Note) and cbc:SettlementDiscountPercent and cac:SettlementPeriod) or not ((cbc:Note))">
          <xsl:attribute name="id">ATGOV-T14-R004</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[ATGOV-T14-R004]-A credit note should not specify only textual payment terms.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="((cbc:SettlementDiscountPercent) and number(cbc:SettlementDiscountPercent) > 0 and number(cbc:SettlementDiscountPercent) &lt; 100) or not ((cbc:SettlementDiscountPercent))" />
      <xsl:otherwise>
        <svrl:failed-assert test="((cbc:SettlementDiscountPercent) and number(cbc:SettlementDiscountPercent) > 0 and number(cbc:SettlementDiscountPercent) &lt; 100) or not ((cbc:SettlementDiscountPercent))">
          <xsl:attribute name="id">ATGOV-T14-R010</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[ATGOV-T14-R010]-The percentage of a cashback item must be greater 0 and lower than 100.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M5" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:CreditNote/cac:AccountingSupplierParty/cac:Party" mode="M5" priority="1000">
    <svrl:fired-rule context="/ubl:CreditNote/cac:AccountingSupplierParty/cac:Party" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(cac:Contact/cbc:ElectronicMail)" />
      <xsl:otherwise>
        <svrl:failed-assert test="(cac:Contact/cbc:ElectronicMail)">
          <xsl:attribute name="id">ATGOV-T14-R001</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[ATGOV-T14-R001]-The email address of the biller is mandatory.</svrl:text>
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
