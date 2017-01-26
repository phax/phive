<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<axsl:stylesheet xmlns:axsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sch="http://www.ascc.net/xml/schematron" xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:ubl="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" version="1.0"><!--Implementers: please note that overriding process-prolog or process-root is 
    the preferred method for meta-stylesheets to use where possible. -->

   <axsl:param name="archiveDirParameter"/>
   <axsl:param name="archiveNameParameter"/>
   <axsl:param name="fileNameParameter"/>
   <axsl:param name="fileDirParameter"/>

<!--PHASES-->


<!--PROLOG-->

   <axsl:output xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:svrl="http://purl.oclc.org/dsdl/svrl" method="xml" omit-xml-declaration="no" standalone="yes" indent="yes"/>

<!--KEYS-->


<!--DEFAULT RULES-->


<!--MODE: SCHEMATRON-SELECT-FULL-PATH-->
<!--This mode can be used to generate an ugly though full XPath for locators-->

   <axsl:template match="*" mode="schematron-select-full-path">
      <axsl:apply-templates select="." mode="schematron-get-full-path"/>
   </axsl:template>

<!--MODE: SCHEMATRON-FULL-PATH-->
<!--This mode can be used to generate an ugly though full XPath for locators-->

   <axsl:template match="*" mode="schematron-get-full-path">
      <axsl:apply-templates select="parent::*" mode="schematron-get-full-path"/>
      <axsl:text>/</axsl:text>
      <axsl:choose>
         <axsl:when test="namespace-uri()=''">
            <axsl:value-of select="name()"/>
            <axsl:variable name="p_1" select="1+    count(preceding-sibling::*[name()=name(current())])"/>
            <axsl:if test="$p_1&gt;1 or following-sibling::*[name()=name(current())]">[<axsl:value-of select="$p_1"/>]</axsl:if>
         </axsl:when>
         <axsl:otherwise>
            <axsl:text>*[local-name()='</axsl:text>
            <axsl:value-of select="local-name()"/>
            <axsl:text>' and namespace-uri()='</axsl:text>
            <axsl:value-of select="namespace-uri()"/>
            <axsl:text>']</axsl:text>
            <axsl:variable name="p_2" select="1+   count(preceding-sibling::*[local-name()=local-name(current())])"/>
            <axsl:if test="$p_2&gt;1 or following-sibling::*[local-name()=local-name(current())]">[<axsl:value-of select="$p_2"/>]</axsl:if>
         </axsl:otherwise>
      </axsl:choose>
   </axsl:template>
   <axsl:template match="@*" mode="schematron-get-full-path">
      <axsl:text>/</axsl:text>
      <axsl:choose>
         <axsl:when test="namespace-uri()=''">@<axsl:value-of select="name()"/>
         </axsl:when>
         <axsl:otherwise>
            <axsl:text>@*[local-name()='</axsl:text>
            <axsl:value-of select="local-name()"/>
            <axsl:text>' and namespace-uri()='</axsl:text>
            <axsl:value-of select="namespace-uri()"/>
            <axsl:text>']</axsl:text>
         </axsl:otherwise>
      </axsl:choose>
   </axsl:template>

<!--MODE: SCHEMATRON-FULL-PATH-2-->
<!--This mode can be used to generate prefixed XPath for humans-->

   <axsl:template match="node() | @*" mode="schematron-get-full-path-2">
      <axsl:for-each select="ancestor-or-self::*">
         <axsl:text>/</axsl:text>
         <axsl:value-of select="name(.)"/>
         <axsl:if test="preceding-sibling::*[name(.)=name(current())]">
            <axsl:text>[</axsl:text>
            <axsl:value-of select="count(preceding-sibling::*[name(.)=name(current())])+1"/>
            <axsl:text>]</axsl:text>
         </axsl:if>
      </axsl:for-each>
      <axsl:if test="not(self::*)">
         <axsl:text/>/@<axsl:value-of select="name(.)"/>
      </axsl:if>
   </axsl:template>

<!--MODE: GENERATE-ID-FROM-PATH -->

   <axsl:template match="/" mode="generate-id-from-path"/>
   <axsl:template match="text()" mode="generate-id-from-path">
      <axsl:apply-templates select="parent::*" mode="generate-id-from-path"/>
      <axsl:value-of select="concat('.text-', 1+count(preceding-sibling::text()), '-')"/>
   </axsl:template>
   <axsl:template match="comment()" mode="generate-id-from-path">
      <axsl:apply-templates select="parent::*" mode="generate-id-from-path"/>
      <axsl:value-of select="concat('.comment-', 1+count(preceding-sibling::comment()), '-')"/>
   </axsl:template>
   <axsl:template match="processing-instruction()" mode="generate-id-from-path">
      <axsl:apply-templates select="parent::*" mode="generate-id-from-path"/>
      <axsl:value-of select="concat('.processing-instruction-', 1+count(preceding-sibling::processing-instruction()), '-')"/>
   </axsl:template>
   <axsl:template match="@*" mode="generate-id-from-path">
      <axsl:apply-templates select="parent::*" mode="generate-id-from-path"/>
      <axsl:value-of select="concat('.@', name())"/>
   </axsl:template>
   <axsl:template match="*" mode="generate-id-from-path" priority="-0.5">
      <axsl:apply-templates select="parent::*" mode="generate-id-from-path"/>
      <axsl:text>.</axsl:text>
      <axsl:value-of select="concat('.',name(),'-',1+count(preceding-sibling::*[name()=name(current())]),'-')"/>
   </axsl:template><!--MODE: SCHEMATRON-FULL-PATH-3-->
<!--This mode can be used to generate prefixed XPath for humans 
	(Top-level element has index)-->

   <axsl:template match="node() | @*" mode="schematron-get-full-path-3">
      <axsl:for-each select="ancestor-or-self::*">
         <axsl:text>/</axsl:text>
         <axsl:value-of select="name(.)"/>
         <axsl:if test="parent::*">
            <axsl:text>[</axsl:text>
            <axsl:value-of select="count(preceding-sibling::*[name(.)=name(current())])+1"/>
            <axsl:text>]</axsl:text>
         </axsl:if>
      </axsl:for-each>
      <axsl:if test="not(self::*)">
         <axsl:text/>/@<axsl:value-of select="name(.)"/>
      </axsl:if>
   </axsl:template>

<!--MODE: GENERATE-ID-2 -->

   <axsl:template match="/" mode="generate-id-2">U</axsl:template>
   <axsl:template match="*" mode="generate-id-2" priority="2">
      <axsl:text>U</axsl:text>
      <axsl:number level="multiple" count="*"/>
   </axsl:template>
   <axsl:template match="node()" mode="generate-id-2">
      <axsl:text>U.</axsl:text>
      <axsl:number level="multiple" count="*"/>
      <axsl:text>n</axsl:text>
      <axsl:number count="node()"/>
   </axsl:template>
   <axsl:template match="@*" mode="generate-id-2">
      <axsl:text>U.</axsl:text>
      <axsl:number level="multiple" count="*"/>
      <axsl:text>_</axsl:text>
      <axsl:value-of select="string-length(local-name(.))"/>
      <axsl:text>_</axsl:text>
      <axsl:value-of select="translate(name(),':','.')"/>
   </axsl:template><!--Strip characters-->
   <axsl:template match="text()" priority="-1"/>

<!--SCHEMA METADATA-->

   <axsl:template match="/">
      <svrl:schematron-output xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" title="BIIRULES  T10 bound to UBL" schemaVersion="">
         <axsl:comment>
            <axsl:value-of select="$archiveDirParameter"/>   
		 <axsl:value-of select="$archiveNameParameter"/>  
		 <axsl:value-of select="$fileNameParameter"/>  
		 <axsl:value-of select="$fileDirParameter"/>
         </axsl:comment>
         <svrl:ns-prefix-in-attribute-values uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" prefix="cbc"/>
         <svrl:ns-prefix-in-attribute-values uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" prefix="cac"/>
         <svrl:ns-prefix-in-attribute-values uri="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" prefix="ubl"/>
         <svrl:active-pattern>
            <axsl:attribute name="id">BII-UBL-T10</axsl:attribute>
            <axsl:attribute name="name">BII-UBL-T10</axsl:attribute>
            <axsl:apply-templates/>
         </svrl:active-pattern>
         <axsl:apply-templates select="/" mode="M6"/>
         <svrl:active-pattern>
            <axsl:attribute name="id">BII-CodesT10</axsl:attribute>
            <axsl:attribute name="name">BII-CodesT10</axsl:attribute>
            <axsl:apply-templates/>
         </svrl:active-pattern>
         <axsl:apply-templates select="/" mode="M7"/>
      </svrl:schematron-output>
   </axsl:template>

<!--SCHEMATRON PATTERNS-->

   <svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron">BIIRULES  T10 bound to UBL</svrl:text>

<!--PATTERN BII-UBL-T10-->


	<!--RULE -->

   <axsl:template match="/ubl:Invoice/cac:AllowanceCharge" priority="1006" mode="M6">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" context="/ubl:Invoice/cac:AllowanceCharge"/>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="(cbc:AllowanceChargeReason)"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="(cbc:AllowanceChargeReason)">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R025]-Each document level allowance or charge details MUST have an allowance and charge reason text</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="(/ubl:Invoice/cac:TaxTotal/*/*/*/cbc:ID = 'VAT') and (cac:TaxCategory/cbc:ID)"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="(/ubl:Invoice/cac:TaxTotal/*/*/*/cbc:ID = 'VAT') and (cac:TaxCategory/cbc:ID)">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R043]-Document level allowances and charges details MUST have allowance and charge VAT category if the invoice has a VAT total amount</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>
      <axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M6"/>
   </axsl:template>

	<!--RULE -->

   <axsl:template match="/ubl:Invoice" priority="1005" mode="M6">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" context="/ubl:Invoice"/>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="(cbc:CustomizationID)"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="(cbc:CustomizationID)">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R001]-An invoice MUST have a customization identifier</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="(cbc:ProfileID)"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="(cbc:ProfileID)">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R002]-An invoice MUST have a business profile identifier</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="(cbc:ID)"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="(cbc:ID)">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R003]-An invoice MUST have an invoice identifier</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="(cbc:IssueDate)"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="(cbc:IssueDate)">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R004]-An invoice MUST have an invoice issue date</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="(cbc:DocumentCurrencyCode)"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="(cbc:DocumentCurrencyCode)">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R005]-An invoice MUST specify the currency code for the document</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="(cac:AccountingSupplierParty/cac:Party/cac:PartyName/cbc:Name) or (cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID)"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="(cac:AccountingSupplierParty/cac:Party/cac:PartyName/cbc:Name) or (cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID)">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R006]-An invoice MUST have a seller name and/or a seller identifier</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="(cac:AccountingCustomerParty/cac:Party/cac:PartyName/cbc:Name) or (cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID)"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="(cac:AccountingCustomerParty/cac:Party/cac:PartyName/cbc:Name) or (cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID)">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R008]-An invoice MUST have a buyer name and/or a buyer identifier</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="(cac:LegalMonetaryTotal/cbc:LineExtensionAmount)"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="(cac:LegalMonetaryTotal/cbc:LineExtensionAmount)">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R010]-An invoice MUST have the sum of line amounts</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="(cac:LegalMonetaryTotal/cbc:TaxExclusiveAmount)"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="(cac:LegalMonetaryTotal/cbc:TaxExclusiveAmount)">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R011]-An invoice MUST have the invoice total without VAT</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="(cac:LegalMonetaryTotal/cbc:TaxInclusiveAmount)"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="(cac:LegalMonetaryTotal/cbc:TaxInclusiveAmount)">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R012]-An invoice MUST have the invoice total with VAT (value of purchase)</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="(cac:LegalMonetaryTotal/cbc:PayableAmount)"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="(cac:LegalMonetaryTotal/cbc:PayableAmount)">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R013]-An invoice MUST have the amount due for payment</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="(cac:InvoiceLine)"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="(cac:InvoiceLine)">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R014]-An invoice MUST have at least one invoice line</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="(cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = 'VAT']/cbc:TaxAmount) or not(cac:InvoiceLine/cac:TaxTotal)"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="(cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = 'VAT']/cbc:TaxAmount) or not(cac:InvoiceLine/cac:TaxTotal)">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R015]-An invoice MUST specify the VAT total amount, if there are VAT line amounts</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="(//cac:TaxScheme/cbc:ID = 'VAT') or not(/ubl:Invoice/cac:TaxTotal/cbc:TaxAmount)"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="(//cac:TaxScheme/cbc:ID = 'VAT') or not(/ubl:Invoice/cac:TaxTotal/cbc:TaxAmount)">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R026]-An invoice MUST contain VAT category details unless VAT total amount is omitted.</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="number(cac:LegalMonetaryTotal/cbc:TaxInclusiveAmount) &gt;= 0"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="number(cac:LegalMonetaryTotal/cbc:TaxInclusiveAmount) &gt;= 0">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R035]-Invoice total with VAT MUST NOT be negative</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="number(cac:LegalMonetaryTotal/cbc:PayableAmount) &gt;= 0"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="number(cac:LegalMonetaryTotal/cbc:PayableAmount) &gt;= 0">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R037]-Amount due for payment in an invoice MUST NOT be negative</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID) or not(cac:TaxTotal/*/*/*/cbc:ID = 'VAT')"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID) or not(cac:TaxTotal/*/*/*/cbc:ID = 'VAT')">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R044]-A seller VAT identifier MUST be provided if the invoice has a VAT total amount</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="(cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID) or not(cac:TaxTotal/*/*/cbc:ID = 'AE')"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="(cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID) or not(cac:TaxTotal/*/*/cbc:ID = 'AE')">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R047]-A buyer VAT identifier MUST be present if the VAT category code is reverse VAT</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="(cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cbc:ID = 'AE']/cbc:TaxableAmount = (cac:LegalMonetaryTotal/cbc:TaxExclusiveAmount)) or  not(cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cbc:ID = 'AE']/cbc:TaxableAmount)"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="(cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cbc:ID = 'AE']/cbc:TaxableAmount = (cac:LegalMonetaryTotal/cbc:TaxExclusiveAmount)) or not(cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cbc:ID = 'AE']/cbc:TaxableAmount)">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R049]-The invoice total without VAT MUST be equal to the VAT category taxable amount if the VAT category code is reverse charge</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="(cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cbc:ID = 'AE']/cbc:TaxAmount = 0) or  not(cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cbc:ID = 'AE']/cbc:TaxAmount)"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="(cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cbc:ID = 'AE']/cbc:TaxAmount = 0) or not(cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cbc:ID = 'AE']/cbc:TaxAmount)">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R050]-The VAT category tax amount MUST be zero  if the VAT category code is reverse charge (since there is only one VAT category allowed it follows that the invoice tax total for reverse charge invoices is zero)</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="count(child::cac:TaxTotal/*/*/cbc:ID) = count(child::cac:TaxTotal/*/*/cbc:ID[. = 'AE']) or count(child::cac:TaxTotal/*/*/cbc:ID[. = 'AE']) = 0"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="count(child::cac:TaxTotal/*/*/cbc:ID) = count(child::cac:TaxTotal/*/*/cbc:ID[. = 'AE']) or count(child::cac:TaxTotal/*/*/cbc:ID[. = 'AE']) = 0">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R048]-An invoice with a VAT category code of reverse charge MUST NOT contain other VAT categories.</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>
      <axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M6"/>
   </axsl:template>

	<!--RULE -->

   <axsl:template match="//cac:InvoiceLine" priority="1004" mode="M6">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" context="//cac:InvoiceLine"/>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="(cbc:ID)"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="(cbc:ID)">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R017]-Each invoice line MUST have an invoice line identifier</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="(cbc:InvoicedQuantity)"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="(cbc:InvoicedQuantity)">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R018]-Each invoice line MUST have an invoiced quantity</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="(cbc:InvoicedQuantity/@unitCode)"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="(cbc:InvoicedQuantity/@unitCode)">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R019]-Each invoice line MUST have a quantity unit of measure</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="cbc:LineExtensionAmount"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="cbc:LineExtensionAmount">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R020]-Each invoice line MUST have an invoice line net amount</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="(cac:Item/cbc:Name) or (cac:Item/cac:StandardItemIdentification/cbc:ID) or  (cac:Item/cac:SellersItemIdentification/cbc:ID)"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="(cac:Item/cbc:Name) or (cac:Item/cac:StandardItemIdentification/cbc:ID) or (cac:Item/cac:SellersItemIdentification/cbc:ID)">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R021]-Each invoice line MUST have an invoice line item name and/or the invoice line item identifier</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="(//cac:StandardItemIdentification/cbc:ID/@schemeID) or not(//cac:StandardItemIdentification)"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="(//cac:StandardItemIdentification/cbc:ID/@schemeID) or not(//cac:StandardItemIdentification)">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R032]-A scheme identifier for the invoice line item registered identifier MUST be provided if invoice line item registered identifiers are used to identify a product.(e.g. GTIN)</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="(//cac:CommodityClassification/cbc:ItemClassificationCode/@listID) or not(//cac:CommodityClassification)"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="(//cac:CommodityClassification/cbc:ItemClassificationCode/@listID) or not(//cac:CommodityClassification)">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R033]-A scheme identifier for a invoice line item commodity classification MUST be provided if invoice line item commodity classification are used to classify an invoice line item (e.g. CPV or UNSPSC)</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="number(cac:Price/cbc:PriceAmount) &gt;= 0"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="number(cac:Price/cbc:PriceAmount) &gt;= 0">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R034]-Invoice line item net price MUST NOT be negative</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="(cac:Item/cac:ClassifiedTaxCategory/cbc:ID) or not(/ubl:Invoice/cac:TaxTotal/*/*/*/cbc:ID='VAT')"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="(cac:Item/cac:ClassifiedTaxCategory/cbc:ID) or not(/ubl:Invoice/cac:TaxTotal/*/*/*/cbc:ID='VAT')">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R046]-Each invoice line MUST be categorized with the invoice line VAT category if the invoice has a VAT total amount </svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>
      <axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M6"/>
   </axsl:template>

	<!--RULE -->

   <axsl:template match="//cac:InvoicePeriod" priority="1003" mode="M6">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" context="//cac:InvoicePeriod"/>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="(cbc:StartDate)"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="(cbc:StartDate)">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R023]-Each invoice period information MUST have an invoice period start date</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="(cbc:EndDate)"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="(cbc:EndDate)">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R024]-Each invoice period information MUST have an invoice period end date</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="(cbc:StartDate and cbc:EndDate) and (number(translate(cbc:StartDate,'-','')) &lt;= number(translate(cbc:EndDate,'-','')))"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="(cbc:StartDate and cbc:EndDate) and (number(translate(cbc:StartDate,'-','')) &lt;= number(translate(cbc:EndDate,'-','')))">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R031]-An invoice period end date MUST be later or equal to an invoice period start date</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>
      <axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M6"/>
   </axsl:template>

	<!--RULE -->

   <axsl:template match="//cac:PaymentMeans" priority="1002" mode="M6">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" context="//cac:PaymentMeans"/>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="((cbc:PaymentMeansCode = '31') and (cac:PayeeFinancialAccount/cbc:ID)) or (cbc:PaymentMeansCode != '31')"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="((cbc:PaymentMeansCode = '31') and (cac:PayeeFinancialAccount/cbc:ID)) or (cbc:PaymentMeansCode != '31')">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R039]-An account identifier MUST be present if payment means type is funds transfer</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="(cac:PayeeFinancialAccount/cbc:ID/@schemeID and (cac:PayeeFinancialAccount/cbc:ID/@schemeID = 'IBAN') and cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cbc:ID) or (cac:PayeeFinancialAccount/cbc:ID/@schemeID != 'IBAN') or (not(cac:PayeeFinancialAccount/cbc:ID/@schemeID))"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="(cac:PayeeFinancialAccount/cbc:ID/@schemeID and (cac:PayeeFinancialAccount/cbc:ID/@schemeID = 'IBAN') and cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cbc:ID) or (cac:PayeeFinancialAccount/cbc:ID/@schemeID != 'IBAN') or (not(cac:PayeeFinancialAccount/cbc:ID/@schemeID))">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R040]-A sellers financial institution identifier MUST be provided if the scheme of the account identifier is IBAN and the payment means is international bank transfer</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="(cbc:PaymentMeansCode)"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="(cbc:PaymentMeansCode)">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R041]-A payment means MUST specify the payment means type</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="(cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cbc:ID/@schemeID='BIC') and (cac:PayeeFinancialAccount/cbc:ID/@schemeID = 'IBAN') or not(cac:PayeeFinancialAccount/cbc:ID/@schemeID = 'IBAN')"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="(cac:PayeeFinancialAccount/cac:FinancialInstitutionBranch/cac:FinancialInstitution/cbc:ID/@schemeID='BIC') and (cac:PayeeFinancialAccount/cbc:ID/@schemeID = 'IBAN') or not(cac:PayeeFinancialAccount/cbc:ID/@schemeID = 'IBAN')">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R042]-A sellers financial institution identifier scheme MUST be BIC if the scheme of the account identifier is IBAN and the payment means type is international account transfer </svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>
      <axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M6"/>
   </axsl:template>

	<!--RULE -->

   <axsl:template match="//cac:LegalMonetaryTotal" priority="1001" mode="M6">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" context="//cac:LegalMonetaryTotal"/>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="number(cbc:LineExtensionAmount) = number(round(sum(//cac:InvoiceLine/cbc:LineExtensionAmount) * 10 * 10) div 100)"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="number(cbc:LineExtensionAmount) = number(round(sum(//cac:InvoiceLine/cbc:LineExtensionAmount) * 10 * 10) div 100)">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R051]-Sum of line amounts MUST equal the invoice line net amounts</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="((cbc:ChargeTotalAmount) and (cbc:AllowanceTotalAmount) and (number(cbc:TaxExclusiveAmount) = round((number(cbc:LineExtensionAmount) + number(cbc:ChargeTotalAmount) - number(cbc:AllowanceTotalAmount)) * 10 * 10) div 100 ))  or (not(cbc:ChargeTotalAmount) and (cbc:AllowanceTotalAmount) and (number(cbc:TaxExclusiveAmount) = round((number(cbc:LineExtensionAmount) - number(cbc:AllowanceTotalAmount)) * 10 * 10 ) div 100)) or ((cbc:ChargeTotalAmount) and not(cbc:AllowanceTotalAmount) and (number(cbc:TaxExclusiveAmount) = round((number(cbc:LineExtensionAmount) + number(cbc:ChargeTotalAmount)) * 10 * 10 ) div 100)) or (not(cbc:ChargeTotalAmount) and not(cbc:AllowanceTotalAmount) and (number(cbc:TaxExclusiveAmount) = number(cbc:LineExtensionAmount)))"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="((cbc:ChargeTotalAmount) and (cbc:AllowanceTotalAmount) and (number(cbc:TaxExclusiveAmount) = round((number(cbc:LineExtensionAmount) + number(cbc:ChargeTotalAmount) - number(cbc:AllowanceTotalAmount)) * 10 * 10) div 100 )) or (not(cbc:ChargeTotalAmount) and (cbc:AllowanceTotalAmount) and (number(cbc:TaxExclusiveAmount) = round((number(cbc:LineExtensionAmount) - number(cbc:AllowanceTotalAmount)) * 10 * 10 ) div 100)) or ((cbc:ChargeTotalAmount) and not(cbc:AllowanceTotalAmount) and (number(cbc:TaxExclusiveAmount) = round((number(cbc:LineExtensionAmount) + number(cbc:ChargeTotalAmount)) * 10 * 10 ) div 100)) or (not(cbc:ChargeTotalAmount) and not(cbc:AllowanceTotalAmount) and (number(cbc:TaxExclusiveAmount) = number(cbc:LineExtensionAmount)))">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R052]-An invoice total without VAT MUST equal the sum of line amounts plus the sum of charges on document level minus the sum of allowances on document level</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="((cbc:PayableRoundingAmount) and (number(cbc:TaxInclusiveAmount) = (round((number(cbc:TaxExclusiveAmount) + number(sum(/ubl:Invoice/cac:TaxTotal/cbc:TaxAmount)) + number(cbc:PayableRoundingAmount)) *10 * 10) div 100))) or (number(cbc:TaxInclusiveAmount) = round(( number(cbc:TaxExclusiveAmount) + number(sum(/ubl:Invoice/cac:TaxTotal/cbc:TaxAmount))) * 10 * 10) div 100)"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="((cbc:PayableRoundingAmount) and (number(cbc:TaxInclusiveAmount) = (round((number(cbc:TaxExclusiveAmount) + number(sum(/ubl:Invoice/cac:TaxTotal/cbc:TaxAmount)) + number(cbc:PayableRoundingAmount)) *10 * 10) div 100))) or (number(cbc:TaxInclusiveAmount) = round(( number(cbc:TaxExclusiveAmount) + number(sum(/ubl:Invoice/cac:TaxTotal/cbc:TaxAmount))) * 10 * 10) div 100)">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R053]-An invoice total with VAT MUST equal the invoice total without VAT plus the VAT total amount and the rounding of invoice total</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="cbc:AllowanceTotalAmount = (round(sum(/ubl:Invoice/cac:AllowanceCharge[cbc:ChargeIndicator=&#34;false&#34;]/cbc:Amount) * 10 * 10) div 100) or not(cbc:AllowanceTotalAmount)"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="cbc:AllowanceTotalAmount = (round(sum(/ubl:Invoice/cac:AllowanceCharge[cbc:ChargeIndicator=&#34;false&#34;]/cbc:Amount) * 10 * 10) div 100) or not(cbc:AllowanceTotalAmount)">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R054]-The sum of allowances at document level MUST be equal to the sum of document level allowance amounts</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="cbc:ChargeTotalAmount = (round(sum(/ubl:Invoice/cac:AllowanceCharge[cbc:ChargeIndicator=&#34;true&#34;]/cbc:Amount) * 10 * 10) div 100) or not(cbc:ChargeTotalAmount)"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="cbc:ChargeTotalAmount = (round(sum(/ubl:Invoice/cac:AllowanceCharge[cbc:ChargeIndicator=&#34;true&#34;]/cbc:Amount) * 10 * 10) div 100) or not(cbc:ChargeTotalAmount)">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R055]-The sum of charges at document level MUST be equal to the sum of document level charge amounts</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="((cbc:PrepaidAmount) and (number(cbc:PayableAmount) = (round((cbc:TaxInclusiveAmount - cbc:PrepaidAmount) * 10 * 10) div 100)) or number(cbc:PayableAmount) = number(cbc:TaxInclusiveAmount)) or ((cbc:PrepaidAmount) and (cbc:PayableRoundingAmount) and ((number(cbc:PayableAmount) -number(cbc:PayableRoundingAmount)) = (round((cbc:TaxInclusiveAmount - cbc:PrepaidAmount) * 10 * 10) div 100)) or (number(cbc:PayableAmount) - number(cbc:PayableRoundingAmount))= number(cbc:TaxInclusiveAmount))"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="((cbc:PrepaidAmount) and (number(cbc:PayableAmount) = (round((cbc:TaxInclusiveAmount - cbc:PrepaidAmount) * 10 * 10) div 100)) or number(cbc:PayableAmount) = number(cbc:TaxInclusiveAmount)) or ((cbc:PrepaidAmount) and (cbc:PayableRoundingAmount) and ((number(cbc:PayableAmount) -number(cbc:PayableRoundingAmount)) = (round((cbc:TaxInclusiveAmount - cbc:PrepaidAmount) * 10 * 10) div 100)) or (number(cbc:PayableAmount) - number(cbc:PayableRoundingAmount))= number(cbc:TaxInclusiveAmount))">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R056]-Amount due for payment MUST be equal to the invoice total amount with VAT minus the paid amounts</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="((cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = 'VAT']/cbc:TaxAmount) and (round(sum(cac:TaxTotal//cac:TaxSubtotal/cbc:TaxableAmount) *10 * 10) div 100 = number(cac:LegalMonetaryTotal/cbc:TaxExclusiveAmount))) or  not((cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = 'VAT']))"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="((cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = 'VAT']/cbc:TaxAmount) and (round(sum(cac:TaxTotal//cac:TaxSubtotal/cbc:TaxableAmount) *10 * 10) div 100 = number(cac:LegalMonetaryTotal/cbc:TaxExclusiveAmount))) or not((cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = 'VAT']))">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R058]-Invoice total without VAT MUST be equal to the sum of VAT category taxable amounts</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>
      <axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M6"/>
   </axsl:template>

	<!--RULE -->

   <axsl:template match="//cac:TaxSubtotal[cac:TaxCategory/cac:TaxScheme/cbc:ID = 'VAT']" priority="1000" mode="M6">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" context="//cac:TaxSubtotal[cac:TaxCategory/cac:TaxScheme/cbc:ID = 'VAT']"/>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="(cbc:TaxableAmount)"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="(cbc:TaxableAmount)">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R027]-Each VAT category details MUST have a VAT category taxable amount</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="(cbc:TaxAmount)"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="(cbc:TaxAmount)">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R028]-Each VAT category details MUST have a VAT category tax amount</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="(cac:TaxCategory/cbc:ID)"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="(cac:TaxCategory/cbc:ID)">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R029]-Every VAT category details MUST be defined through a VAT category code</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="(cac:TaxCategory/cbc:Percent) or not(cac:TaxCategory/cbc:ID = 'S')"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="(cac:TaxCategory/cbc:Percent) or not(cac:TaxCategory/cbc:ID = 'S')">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R030]-The VAT category percentage MUST be provided if the VAT category code is standard.</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="(cac:TaxCategory/cbc:TaxExemptionReason) or not ((cac:TaxCategory/cbc:ID='E') or (cac:TaxCategory/cbc:ID='AE'))"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="(cac:TaxCategory/cbc:TaxExemptionReason) or not ((cac:TaxCategory/cbc:ID='E') or (cac:TaxCategory/cbc:ID='AE'))">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[BII2-T10-R045]-A VAT exemption reason MUST be provided if the VAT category code is exempt or reverse charge.</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>
      <axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M6"/>
   </axsl:template>
   <axsl:template match="text()" priority="-1" mode="M6"/>
   <axsl:template match="@*|node()" priority="-2" mode="M6">
      <axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M6"/>
   </axsl:template>

<!--PATTERN BII-CodesT10-->


	<!--RULE -->

   <axsl:template match="cbc:InvoiceTypeCode" priority="1007" mode="M7">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" context="cbc:InvoiceTypeCode"/>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="( ( not(contains(normalize-space(.),' ')) and contains( ' 380 393 384 ',concat(' ',normalize-space(.),' ') ) ) )"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="( ( not(contains(normalize-space(.),' ')) and contains( ' 380 393 384 ',concat(' ',normalize-space(.),' ') ) ) )">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[CL-T10-R001]-An Invoice MUST be coded with the InvoiceTypeCode code list UNCL D1001 BII2 subset</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>
      <axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M7"/>
   </axsl:template>

	<!--RULE -->

   <axsl:template match="cbc:DocumentCurrencyCode" priority="1006" mode="M7">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" context="cbc:DocumentCurrencyCode"/>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="( ( not(contains(normalize-space(.),' ')) and contains( ' AED AFN ALL AMD ANG AOA ARS AUD AWG AZN BAM BBD BDT BGN BHD BIF BMD BND BOB BOV BRL BSD BTN BWP BYR BZD CAD CDF CHE CHF CHW CLF CLP CNY COP COU CRC CUP CVE CZK DJF DKK DOP DZD EEK EGP ERN ETB EUR FJD FKP GBP GEL GHS GIP GMD GNF GTQ GWP GYD HKD HNL HRK HTG HUF IDR ILS INR IQD IRR ISK JMD JOD JPY KES KGS KHR KMF KPW KRW KWD KYD KZT LAK LBP LKR LRD LSL LTL LVL LYD MAD MDL MGA MKD MMK MNT MOP MRO MUR MVR MWK MXN MXV MYR MZN NAD NGN NIO NOK NPR NZD OMR PAB PEN PGK PHP PKR PLN PYG QAR RON RSD RUB RWF SAR SBD SCR SDG SEK SGD SHP SKK SLL SOS SRD STD SVC SYP SZL THB TJS TMM TND TOP TRY TTD TWD TZS UAH UGX USD USN USS UYI UYU UZS VEF VND VUV WST XAF XAG XAU XBA XBB XBC XBD XCD XDR XFU XOF XPD XPF XTS XXX YER ZAR ZMK ZWR ZWD ',concat(' ',normalize-space(.),' ') ) ) )"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="( ( not(contains(normalize-space(.),' ')) and contains( ' AED AFN ALL AMD ANG AOA ARS AUD AWG AZN BAM BBD BDT BGN BHD BIF BMD BND BOB BOV BRL BSD BTN BWP BYR BZD CAD CDF CHE CHF CHW CLF CLP CNY COP COU CRC CUP CVE CZK DJF DKK DOP DZD EEK EGP ERN ETB EUR FJD FKP GBP GEL GHS GIP GMD GNF GTQ GWP GYD HKD HNL HRK HTG HUF IDR ILS INR IQD IRR ISK JMD JOD JPY KES KGS KHR KMF KPW KRW KWD KYD KZT LAK LBP LKR LRD LSL LTL LVL LYD MAD MDL MGA MKD MMK MNT MOP MRO MUR MVR MWK MXN MXV MYR MZN NAD NGN NIO NOK NPR NZD OMR PAB PEN PGK PHP PKR PLN PYG QAR RON RSD RUB RWF SAR SBD SCR SDG SEK SGD SHP SKK SLL SOS SRD STD SVC SYP SZL THB TJS TMM TND TOP TRY TTD TWD TZS UAH UGX USD USN USS UYI UYU UZS VEF VND VUV WST XAF XAG XAU XBA XBB XBC XBD XCD XDR XFU XOF XPD XPF XTS XXX YER ZAR ZMK ZWR ZWD ',concat(' ',normalize-space(.),' ') ) ) )">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[CL-T10-R002]-DocumentCurrencyCode MUST be coded using ISO code list 4217</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>
      <axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M7"/>
   </axsl:template>

	<!--RULE -->

   <axsl:template match="@currencyID" priority="1005" mode="M7">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" context="@currencyID"/>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="( ( not(contains(normalize-space(.),' ')) and contains( ' AED AFN ALL AMD ANG AOA ARS AUD AWG AZN BAM BBD BDT BGN BHD BIF BMD BND BOB BOV BRL BSD BTN BWP BYR BZD CAD CDF CHE CHF CHW CLF CLP CNY COP COU CRC CUP CVE CZK DJF DKK DOP DZD EEK EGP ERN ETB EUR FJD FKP GBP GEL GHS GIP GMD GNF GTQ GWP GYD HKD HNL HRK HTG HUF IDR ILS INR IQD IRR ISK JMD JOD JPY KES KGS KHR KMF KPW KRW KWD KYD KZT LAK LBP LKR LRD LSL LTL LVL LYD MAD MDL MGA MKD MMK MNT MOP MRO MUR MVR MWK MXN MXV MYR MZN NAD NGN NIO NOK NPR NZD OMR PAB PEN PGK PHP PKR PLN PYG QAR RON RSD RUB RWF SAR SBD SCR SDG SEK SGD SHP SKK SLL SOS SRD STD SVC SYP SZL THB TJS TMM TND TOP TRY TTD TWD TZS UAH UGX USD USN USS UYI UYU UZS VEF VND VUV WST XAF XAG XAU XBA XBB XBC XBD XCD XDR XFU XOF XPD XPF XTS XXX YER ZAR ZMK ZWR ZWD ',concat(' ',normalize-space(.),' ') ) ) )"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="( ( not(contains(normalize-space(.),' ')) and contains( ' AED AFN ALL AMD ANG AOA ARS AUD AWG AZN BAM BBD BDT BGN BHD BIF BMD BND BOB BOV BRL BSD BTN BWP BYR BZD CAD CDF CHE CHF CHW CLF CLP CNY COP COU CRC CUP CVE CZK DJF DKK DOP DZD EEK EGP ERN ETB EUR FJD FKP GBP GEL GHS GIP GMD GNF GTQ GWP GYD HKD HNL HRK HTG HUF IDR ILS INR IQD IRR ISK JMD JOD JPY KES KGS KHR KMF KPW KRW KWD KYD KZT LAK LBP LKR LRD LSL LTL LVL LYD MAD MDL MGA MKD MMK MNT MOP MRO MUR MVR MWK MXN MXV MYR MZN NAD NGN NIO NOK NPR NZD OMR PAB PEN PGK PHP PKR PLN PYG QAR RON RSD RUB RWF SAR SBD SCR SDG SEK SGD SHP SKK SLL SOS SRD STD SVC SYP SZL THB TJS TMM TND TOP TRY TTD TWD TZS UAH UGX USD USN USS UYI UYU UZS VEF VND VUV WST XAF XAG XAU XBA XBB XBC XBD XCD XDR XFU XOF XPD XPF XTS XXX YER ZAR ZMK ZWR ZWD ',concat(' ',normalize-space(.),' ') ) ) )">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[CL-T10-R003]-currencyID MUST be coded using ISO code list 4217</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>
      <axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M7"/>
   </axsl:template>

	<!--RULE -->

   <axsl:template match="cac:Country//cbc:IdentificationCode" priority="1004" mode="M7">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" context="cac:Country//cbc:IdentificationCode"/>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="( ( not(contains(normalize-space(.),' ')) and contains( ' AD AE AF AG AI AL AM AN AO AQ AR AS AT AU AW AX AZ BA BB BD BE BF BG BH BI BL BJ BM BN BO BR BS BT BV BW BY BZ CA CC CD CF CG CH CI CK CL CM CN CO CR CU CV CX CY CZ DE DJ DK DM DO DZ EC EE EG EH ER ES ET FI FJ FK FM FO FR GA GB GD GE GF GG GH GI GL GM GN GP GQ GR GS GT GU GW GY HK HM HN HR HT HU ID IE IL IM IN IO IQ IR IS IT JE JM JO JP KE KG KH KI KM KN KP KR KW KY KZ LA LB LC LI LK LR LS LT LU LV LY MA MC MD ME MF MG MH MK ML MM MN MO MP MQ MR MS MT MU MV MW MX MY MZ NA NC NE NF NG NI NL NO NP NR NU NZ OM PA PE PF PG PH PK PL PM PN PR PS PT PW PY QA RO RS RU RW SA SB SC SD SE SG SH SI SJ SK SL SM SN SO SR ST SV SY SZ TC TD TF TG TH TJ TK TL TM TN TO TR TT TV TW TZ UA UG UM US UY UZ VA VC VE VG VI VN VU WF WS YE YT ZA ZM ZW ',concat(' ',normalize-space(.),' ') ) ) )"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="( ( not(contains(normalize-space(.),' ')) and contains( ' AD AE AF AG AI AL AM AN AO AQ AR AS AT AU AW AX AZ BA BB BD BE BF BG BH BI BL BJ BM BN BO BR BS BT BV BW BY BZ CA CC CD CF CG CH CI CK CL CM CN CO CR CU CV CX CY CZ DE DJ DK DM DO DZ EC EE EG EH ER ES ET FI FJ FK FM FO FR GA GB GD GE GF GG GH GI GL GM GN GP GQ GR GS GT GU GW GY HK HM HN HR HT HU ID IE IL IM IN IO IQ IR IS IT JE JM JO JP KE KG KH KI KM KN KP KR KW KY KZ LA LB LC LI LK LR LS LT LU LV LY MA MC MD ME MF MG MH MK ML MM MN MO MP MQ MR MS MT MU MV MW MX MY MZ NA NC NE NF NG NI NL NO NP NR NU NZ OM PA PE PF PG PH PK PL PM PN PR PS PT PW PY QA RO RS RU RW SA SB SC SD SE SG SH SI SJ SK SL SM SN SO SR ST SV SY SZ TC TD TF TG TH TJ TK TL TM TN TO TR TT TV TW TZ UA UG UM US UY UZ VA VC VE VG VI VN VU WF WS YE YT ZA ZM ZW ',concat(' ',normalize-space(.),' ') ) ) )">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[CL-T10-R004]-Country codes in an invoice MUST be coded using ISO code list 3166-1</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>
      <axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M7"/>
   </axsl:template>

	<!--RULE -->

   <axsl:template match="cac:PaymentMeans//cbc:PaymentMeansCode" priority="1003" mode="M7">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" context="cac:PaymentMeans//cbc:PaymentMeansCode"/>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="( ( not(contains(normalize-space(.),' ')) and contains( ' 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 60 61 62 63 64 65 66 67 70 74 75 76 77 78 91 92 93 94 95 96 97 ',concat(' ',normalize-space(.),' ') ) ) )"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="( ( not(contains(normalize-space(.),' ')) and contains( ' 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 60 61 62 63 64 65 66 67 70 74 75 76 77 78 91 92 93 94 95 96 97 ',concat(' ',normalize-space(.),' ') ) ) )">
               <axsl:attribute name="flag">warning</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[CL-T10-R006]-Payment means in an invoice MUST be coded using UNCL 4461 BII2 subset</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>
      <axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M7"/>
   </axsl:template>

	<!--RULE -->

   <axsl:template match="cac:TaxCategory/cbc:ID" priority="1002" mode="M7">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" context="cac:TaxCategory/cbc:ID"/>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="( ( not(contains(normalize-space(.),' ')) and contains( ' AE E S Z AA H ',concat(' ',normalize-space(.),' ') ) ) )"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="( ( not(contains(normalize-space(.),' ')) and contains( ' AE E S Z AA H ',concat(' ',normalize-space(.),' ') ) ) )">
               <axsl:attribute name="flag">warning</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[CL-T10-R007]-Invoice tax categories MUST be coded using UNCL 5305 code list BII2 subset</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>
      <axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M7"/>
   </axsl:template>

	<!--RULE -->

   <axsl:template match="@mimeCode" priority="1001" mode="M7">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" context="@mimeCode"/>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="( ( . = 'application/activemessage' or . = 'application/andrew-inset' or . = 'application/applefile' or . = 'application/atom+xml' or . = 'application/atomicmail' or . = 'application/atomcat+xml' or . = 'application/atomsvc+xml' or . = 'application/auth-policy+xml' or . = 'application/batch-SMTP' or . = 'application/beep+xml' or . = 'application/cals-1840' or . = 'application/ccxml+xml' or . = 'application/cellml+xml' or . = 'application/cnrp+xml' or . = 'application/commonground' or . = 'application/conference-info+xml' or . = 'application/cpl+xml' or . = 'application/csta+xml' or . = 'application/CSTAdata+xml' or . = 'application/cybercash' or . = 'application/davmount+xml' or . = 'application/dca-rft' or . = 'application/dec-dx' or . = 'application/dialog-info+xml' or . = 'application/dicom' or . = 'application/dns' or . = 'application/dvcs' or . = 'application/ecmascript' or . = 'application/EDI-Consent' or . = 'application/EDIFACT' or . = 'application/EDI-X12' or . = 'application/epp+xml' or . = 'application/eshop' or . = 'application/example' or . = 'application/fastinfoset' or . = 'application/fastsoap' or . = 'application/fits' or . = 'application/font-tdpfr' or . = 'application/H224' or . = 'application/http' or . = 'application/hyperstudio' or . = 'application/iges' or . = 'application/im-iscomposing+xml' or . = 'application/index' or . = 'application/index.cmd' or . = 'application/index.obj' or . = 'application/index.response' or . = 'application/index.vnd' or . = 'application/iotp' or . = 'application/ipp' or . = 'application/isup' or . = 'application/javascript' or . = 'application/json' or . = 'application/kpml-request+xml' or . = 'application/kpml-response+xml' or . = 'application/mac-binhex40' or . = 'application/macwriteii' or . = 'application/marc' or . = 'application/mathematica' or . = 'application/mbms-associated-procedure-description+xml' or . = 'application/mbms-deregister+xml' or . = 'application/mbms-envelope+xml' or . = 'application/mbms-msk-response+xml' or . = 'application/mbms-msk+xml' or . = 'application/mbms-protection-description+xml' or . = 'application/mbms-reception-report+xml' or . = 'application/mbms-register-response+xml' or . = 'application/mbms-register+xml' or . = 'application/mbms-user-service-description+xml' or . = 'application/mbox' or . = 'application/media_control+xml' or . = 'application/mediaservercontrol+xml' or . = 'application/mikey' or . = 'application/moss-keys' or . = 'application/moss-signature' or . = 'application/mosskey-data' or . = 'application/mosskey-request' or . = 'application/mpeg4-generic' or . = 'application/mpeg4-iod' or . = 'application/mpeg4-iod-xmt' or . = 'application/mp4' or . = 'application/msword' or . = 'application/mxf' or . = 'application/nasdata' or . = 'application/news-message-id' or . = 'application/news-transmission' or . = 'application/nss' or . = 'application/ocsp-request' or . = 'application/ocsp-response' or . = 'application/octet-stream' or . = 'application/oda' or . = 'application/oebps-package+xml' or . = 'application/ogg' or . = 'application/parityfec' or . = 'application/pdf' or . = 'application/pgp-encrypted' or . = 'application/pgp-keys' or . = 'application/pgp-signature' or . = 'application/pidf+xml' or . = 'application/pkcs10' or . = 'application/pkcs7-mime' or . = 'application/pkcs7-signature' or . = 'application/pkix-cert' or . = 'application/pkixcmp' or . = 'application/pkix-crl' or . = 'application/pkix-pkipath' or . = 'application/pls+xml' or . = 'application/poc-settings+xml' or . = 'application/postscript' or . = 'application/prs.alvestrand.titrax-sheet' or . = 'application/prs.cww' or . = 'application/prs.nprend' or . = 'application/prs.plucker' or . = 'application/rdf+xml' or . = 'application/qsig' or . = 'application/reginfo+xml' or . = 'application/relax-ng-compact-syntax' or . = 'application/remote-printing' or . = 'application/resource-lists+xml' or . = 'application/riscos' or . = 'application/rlmi+xml' or . = 'application/rls-services+xml' or . = 'application/rtf' or . = 'application/rtx' or . = 'application/samlassertion+xml' or . = 'application/samlmetadata+xml' or . = 'application/sbml+xml' or . = 'application/scvp-cv-request' or . = 'application/scvp-cv-response' or . = 'application/scvp-vp-request' or . = 'application/scvp-vp-response' or . = 'application/sdp' or . = 'application/set-payment' or . = 'application/set-payment-initiation' or . = 'application/set-registration' or . = 'application/set-registration-initiation' or . = 'application/sgml' or . = 'application/sgml-open-catalog' or . = 'application/shf+xml' or . = 'application/sieve' or . = 'application/simple-filter+xml' or . = 'application/simple-message-summary' or . = 'application/simpleSymbolContainer' or . = 'application/slate' or . = 'application/smil (OBSOLETE)' or . = 'application/smil+xml' or . = 'application/soap+fastinfoset' or . = 'application/soap+xml' or . = 'application/sparql-query' or . = 'application/sparql-results+xml' or . = 'application/spirits-event+xml' or . = 'application/srgs' or . = 'application/srgs+xml' or . = 'application/ssml+xml' or . = 'application/timestamp-query' or . = 'application/timestamp-reply' or . = 'application/tve-trigger' or . = 'application/ulpfec' or . = 'application/vemmi' or . = 'application/vnd.3gpp.bsf+xml' or . = 'application/vnd.3gpp.pic-bw-large' or . = 'application/vnd.3gpp.pic-bw-small' or . = 'application/vnd.3gpp.pic-bw-var' or . = 'application/vnd.3gpp.sms' or . = 'application/vnd.3gpp2.bcmcsinfo+xml' or . = 'application/vnd.3gpp2.sms' or . = 'application/vnd.3gpp2.tcap' or . = 'application/vnd.3M.Post-it-Notes' or . = 'application/vnd.accpac.simply.aso' or . = 'application/vnd.accpac.simply.imp' or . = 'application/vnd.acucobol' or . = 'application/vnd.acucorp' or . = 'application/vnd.adobe.xdp+xml' or . = 'application/vnd.adobe.xfdf' or . = 'application/vnd.aether.imp' or . = 'application/vnd.americandynamics.acc' or . = 'application/vnd.amiga.ami' or . = 'application/vnd.anser-web-certificate-issue-initiation' or . = 'application/vnd.antix.game-component' or . = 'application/vnd.apple.installer+xml' or . = 'application/vnd.audiograph' or . = 'application/vnd.autopackage' or . = 'application/vnd.avistar+xml' or . = 'application/vnd.blueice.multipass' or . = 'application/vnd.bmi' or . = 'application/vnd.businessobjects' or . = 'application/vnd.cab-jscript' or . = 'application/vnd.canon-cpdl' or . = 'application/vnd.canon-lips' or . = 'application/vnd.cendio.thinlinc.clientconf' or . = 'application/vnd.chemdraw+xml' or . = 'application/vnd.chipnuts.karaoke-mmd' or . = 'application/vnd.cinderella' or . = 'application/vnd.cirpack.isdn-ext' or . = 'application/vnd.claymore' or . = 'application/vnd.clonk.c4group' or . = 'application/vnd.commerce-battelle' or . = 'application/vnd.commonspace' or . = 'application/vnd.cosmocaller' or . = 'application/vnd.contact.cmsg' or . = 'application/vnd.crick.clicker' or . = 'application/vnd.crick.clicker.keyboard' or . = 'application/vnd.crick.clicker.palette' or . = 'application/vnd.crick.clicker.template' or . = 'application/vnd.crick.clicker.wordbank' or . = 'application/vnd.criticaltools.wbs+xml' or . = 'application/vnd.ctc-posml' or . = 'application/vnd.ctct.ws+xml' or . = 'application/vnd.cups-pdf' or . = 'application/vnd.cups-postscript' or . = 'application/vnd.cups-ppd' or . = 'application/vnd.cups-raster' or . = 'application/vnd.cups-raw' or . = 'application/vnd.curl' or . = 'application/vnd.cybank' or . = 'application/vnd.data-vision.rdz' or . = 'application/vnd.denovo.fcselayout-link' or . = 'application/vnd.dna' or . = 'application/vnd.dpgraph' or . = 'application/vnd.dreamfactory' or . = 'application/vnd.dvb.esgcontainer' or . = 'application/vnd.dvb.ipdcesgaccess' or . = 'application/vnd.dxr' or . = 'application/vnd.ecdis-update' or . = 'application/vnd.ecowin.chart' or . = 'application/vnd.ecowin.filerequest' or . = 'application/vnd.ecowin.fileupdate' or . = 'application/vnd.ecowin.series' or . = 'application/vnd.ecowin.seriesrequest' or . = 'application/vnd.ecowin.seriesupdate' or . = 'application/vnd.enliven' or . = 'application/vnd.epson.esf' or . = 'application/vnd.epson.msf' or . = 'application/vnd.epson.quickanime' or . = 'application/vnd.epson.salt' or . = 'application/vnd.epson.ssf' or . = 'application/vnd.ericsson.quickcall' or . = 'application/vnd.eszigno3+xml' or . = 'application/vnd.eudora.data' or . = 'application/vnd.ezpix-album' or . = 'application/vnd.ezpix-package' or . = 'application/vnd.fdf' or . = 'application/vnd.ffsns' or . = 'application/vnd.fints' or . = 'application/vnd.FloGraphIt' or . = 'application/vnd.fluxtime.clip' or . = 'application/vnd.framemaker' or . = 'application/vnd.frogans.fnc' or . = 'application/vnd.frogans.ltf' or . = 'application/vnd.fsc.weblaunch' or . = 'application/vnd.fujitsu.oasys' or . = 'application/vnd.fujitsu.oasys2' or . = 'application/vnd.fujitsu.oasys3' or . = 'application/vnd.fujitsu.oasysgp' or . = 'application/vnd.fujitsu.oasysprs' or . = 'application/vnd.fujixerox.ART4' or . = 'application/vnd.fujixerox.ART-EX' or . = 'application/vnd.fujixerox.ddd' or . = 'application/vnd.fujixerox.docuworks' or . = 'application/vnd.fujixerox.docuworks.binder' or . = 'application/vnd.fujixerox.HBPL' or . = 'application/vnd.fut-misnet' or . = 'application/vnd.fuzzysheet' or . = 'application/vnd.genomatix.tuxedo' or . = 'application/vnd.google-earth.kml+xml' or . = 'application/vnd.google-earth.kmz' or . = 'application/vnd.grafeq' or . = 'application/vnd.gridmp' or . = 'application/vnd.groove-account' or . = 'application/vnd.groove-help' or . = 'application/vnd.groove-identity-message' or . = 'application/vnd.groove-injector' or . = 'application/vnd.groove-tool-message' or . = 'application/vnd.groove-tool-template' or . = 'application/vnd.groove-vcard' or . = 'application/vnd.HandHeld-Entertainment+xml' or . = 'application/vnd.hbci' or . = 'application/vnd.hcl-bireports' or . = 'application/vnd.hhe.lesson-player' or . = 'application/vnd.hp-HPGL' or . = 'application/vnd.hp-hpid' or . = 'application/vnd.hp-hps' or . = 'application/vnd.hp-jlyt' or . = 'application/vnd.hp-PCL' or . = 'application/vnd.hp-PCLXL' or . = 'application/vnd.httphone' or . = 'application/vnd.hzn-3d-crossword' or . = 'application/vnd.ibm.afplinedata' or . = 'application/vnd.ibm.electronic-media' or . = 'application/vnd.ibm.MiniPay' or . = 'application/vnd.ibm.modcap' or . = 'application/vnd.ibm.rights-management' or . = 'application/vnd.ibm.secure-container' or . = 'application/vnd.iccprofile' or . = 'application/vnd.igloader' or . = 'application/vnd.immervision-ivp' or . = 'application/vnd.immervision-ivu' or . = 'application/vnd.informedcontrol.rms+xml' or . = 'application/vnd.informix-visionary' or . = 'application/vnd.intercon.formnet' or . = 'application/vnd.intertrust.digibox' or . = 'application/vnd.intertrust.nncp' or . = 'application/vnd.intu.qbo' or . = 'application/vnd.intu.qfx' or . = 'application/vnd.ipunplugged.rcprofile' or . = 'application/vnd.irepository.package+xml' or . = 'application/vnd.is-xpr' or . = 'application/vnd.jam' or . = 'application/vnd.japannet-directory-service' or . = 'application/vnd.japannet-jpnstore-wakeup' or . = 'application/vnd.japannet-payment-wakeup' or . = 'application/vnd.japannet-registration' or . = 'application/vnd.japannet-registration-wakeup' or . = 'application/vnd.japannet-setstore-wakeup' or . = 'application/vnd.japannet-verification' or . = 'application/vnd.japannet-verification-wakeup' or . = 'application/vnd.jcp.javame.midlet-rms' or . = 'application/vnd.jisp' or . = 'application/vnd.joost.joda-archive' or . = 'application/vnd.kahootz' or . = 'application/vnd.kde.karbon' or . = 'application/vnd.kde.kchart' or . = 'application/vnd.kde.kformula' or . = 'application/vnd.kde.kivio' or . = 'application/vnd.kde.kontour' or . = 'application/vnd.kde.kpresenter' or . = 'application/vnd.kde.kspread' or . = 'application/vnd.kde.kword' or . = 'application/vnd.kenameaapp' or . = 'application/vnd.kidspiration' or . = 'application/vnd.Kinar' or . = 'application/vnd.koan' or . = 'application/vnd.kodak-descriptor' or . = 'application/vnd.liberty-request+xml' or . = 'application/vnd.llamagraphics.life-balance.desktop' or . = 'application/vnd.llamagraphics.life-balance.exchange+xml' or . = 'application/vnd.lotus-1-2-3' or . = 'application/vnd.lotus-approach' or . = 'application/vnd.lotus-freelance' or . = 'application/vnd.lotus-notes' or . = 'application/vnd.lotus-organizer' or . = 'application/vnd.lotus-screencam' or . = 'application/vnd.lotus-wordpro' or . = 'application/vnd.macports.portpkg' or . = 'application/vnd.marlin.drm.actiontoken+xml' or . = 'application/vnd.marlin.drm.conftoken+xml' or . = 'application/vnd.marlin.drm.mdcf' or . = 'application/vnd.mcd' or . = 'application/vnd.medcalcdata' or . = 'application/vnd.mediastation.cdkey' or . = 'application/vnd.meridian-slingshot' or . = 'application/vnd.MFER' or . = 'application/vnd.mfmp' or . = 'application/vnd.micrografx.flo' or . = 'application/vnd.micrografx.igx' or . = 'application/vnd.mif' or . = 'application/vnd.minisoft-hp3000-save' or . = 'application/vnd.mitsubishi.misty-guard.trustweb' or . = 'application/vnd.Mobius.DAF' or . = 'application/vnd.Mobius.DIS' or . = 'application/vnd.Mobius.MBK' or . = 'application/vnd.Mobius.MQY' or . = 'application/vnd.Mobius.MSL' or . = 'application/vnd.Mobius.PLC' or . = 'application/vnd.Mobius.TXF' or . = 'application/vnd.mophun.application' or . = 'application/vnd.mophun.certificate' or . = 'application/vnd.motorola.flexsuite' or . = 'application/vnd.motorola.flexsuite.adsi' or . = 'application/vnd.motorola.flexsuite.fis' or . = 'application/vnd.motorola.flexsuite.gotap' or . = 'application/vnd.motorola.flexsuite.kmr' or . = 'application/vnd.motorola.flexsuite.ttc' or . = 'application/vnd.motorola.flexsuite.wem' or . = 'application/vnd.mozilla.xul+xml' or . = 'application/vnd.ms-artgalry' or . = 'application/vnd.ms-asf' or . = 'application/vnd.ms-cab-compressed' or . = 'application/vnd.mseq' or . = 'application/vnd.ms-excel' or . = 'application/vnd.ms-fontobject' or . = 'application/vnd.ms-htmlhelp' or . = 'application/vnd.msign' or . = 'application/vnd.ms-ims' or . = 'application/vnd.ms-lrm' or . = 'application/vnd.ms-playready.initiator+xml' or . = 'application/vnd.ms-powerpoint' or . = 'application/vnd.ms-project' or . = 'application/vnd.ms-tnef' or . = 'application/vnd.ms-wmdrm.lic-chlg-req' or . = 'application/vnd.ms-wmdrm.lic-resp' or . = 'application/vnd.ms-wmdrm.meter-chlg-req' or . = 'application/vnd.ms-wmdrm.meter-resp' or . = 'application/vnd.ms-works' or . = 'application/vnd.ms-wpl' or . = 'application/vnd.ms-xpsdocument' or . = 'application/vnd.multiad.creator' or . = 'application/vnd.multiad.creator.cif' or . = 'application/vnd.musician' or . = 'application/vnd.music-niff' or . = 'application/vnd.muvee.style' or . = 'application/vnd.ncd.control' or . = 'application/vnd.ncd.reference' or . = 'application/vnd.nervana' or . = 'application/vnd.netfpx' or . = 'application/vnd.neurolanguage.nlu' or . = 'application/vnd.noblenet-directory' or . = 'application/vnd.noblenet-sealer' or . = 'application/vnd.noblenet-web' or . = 'application/vnd.nokia.catalogs' or . = 'application/vnd.nokia.conml+wbxml' or . = 'application/vnd.nokia.conml+xml' or . = 'application/vnd.nokia.iptv.config+xml' or . = 'application/vnd.nokia.iSDS-radio-presets' or . = 'application/vnd.nokia.landmark+wbxml' or . = 'application/vnd.nokia.landmark+xml' or . = 'application/vnd.nokia.landmarkcollection+xml' or . = 'application/vnd.nokia.ncd' or . = 'application/vnd.nokia.n-gage.ac+xml' or . = 'application/vnd.nokia.n-gage.data' or . = 'application/vnd.nokia.n-gage.symbian.install' or . = 'application/vnd.nokia.pcd+wbxml' or . = 'application/vnd.nokia.pcd+xml' or . = 'application/vnd.nokia.radio-preset' or . = 'application/vnd.nokia.radio-presets' or . = 'application/vnd.novadigm.EDM' or . = 'application/vnd.novadigm.EDX' or . = 'application/vnd.novadigm.EXT' or . = 'application/vnd.oasis.opendocument.chart' or . = 'application/vnd.oasis.opendocument.chart-template' or . = 'application/vnd.oasis.opendocument.formula' or . = 'application/vnd.oasis.opendocument.formula-template' or . = 'application/vnd.oasis.opendocument.graphics' or . = 'application/vnd.oasis.opendocument.graphics-template' or . = 'application/vnd.oasis.opendocument.image' or . = 'application/vnd.oasis.opendocument.image-template' or . = 'application/vnd.oasis.opendocument.presentation' or . = 'application/vnd.oasis.opendocument.presentation-template' or . = 'application/vnd.oasis.opendocument.spreadsheet' or . = 'application/vnd.oasis.opendocument.spreadsheet-template' or . = 'application/vnd.oasis.opendocument.text' or . = 'application/vnd.oasis.opendocument.text-master' or . = 'application/vnd.oasis.opendocument.text-template' or . = 'application/vnd.oasis.opendocument.text-web' or . = 'application/vnd.obn' or . = 'application/vnd.olpc-sugar' or . = 'application/vnd.oma.bcast.associated-procedure-parameter+xml' or . = 'application/vnd.oma.bcast.drm-trigger+xml' or . = 'application/vnd.oma.bcast.imd+xml' or . = 'application/vnd.oma.bcast.ltkm' or . = 'application/vnd.oma.bcast.notification+xml' or . = 'application/vnd.oma.bcast.sgboot' or . = 'application/vnd.oma.bcast.sgdd+xml' or . = 'application/vnd.oma.bcast.sgdu' or . = 'application/vnd.oma.bcast.simple-symbol-container' or . = 'application/vnd.oma.bcast.smartcard-trigger+xml' or . = 'application/vnd.oma.bcast.sprov+xml' or . = 'application/vnd.oma.bcast.stkm' or . = 'application/vnd.oma.dd2+xml' or . = 'application/vnd.oma.drm.risd+xml' or . = 'application/vnd.oma.group-usage-list+xml' or . = 'application/vnd.oma.poc.detailed-progress-report+xml' or . = 'application/vnd.oma.poc.final-report+xml' or . = 'application/vnd.oma.poc.groups+xml' or . = 'application/vnd.oma.poc.invocation-descriptor+xml' or . = 'application/vnd.oma.poc.optimized-progress-report+xml' or . = 'application/vnd.oma.xcap-directory+xml' or . = 'application/vnd.omads-email+xml' or . = 'application/vnd.omads-file+xml' or . = 'application/vnd.omads-folder+xml' or . = 'application/vnd.omaloc-supl-init' or . = 'application/vnd.oma-scws-config' or . = 'application/vnd.oma-scws-http-request' or . = 'application/vnd.oma-scws-http-response' or . = 'application/vnd.openofficeorg.extension' or . = 'application/vnd.osa.netdeploy' or . = 'application/vnd.osgi.bundle' or . = 'application/vnd.osgi.dp' or . = 'application/vnd.otps.ct-kip+xml' or . = 'application/vnd.palm' or . = 'application/vnd.paos.xml' or . = 'application/vnd.pg.format' or . = 'application/vnd.pg.osasli' or . = 'application/vnd.piaccess.application-licence' or . = 'application/vnd.picsel' or . = 'application/vnd.poc.group-advertisement+xml' or . = 'application/vnd.pocketlearn' or . = 'application/vnd.powerbuilder6' or . = 'application/vnd.powerbuilder6-s' or . = 'application/vnd.powerbuilder7' or . = 'application/vnd.powerbuilder75' or . = 'application/vnd.powerbuilder75-s' or . = 'application/vnd.powerbuilder7-s' or . = 'application/vnd.preminet' or . = 'application/vnd.previewsystems.box' or . = 'application/vnd.proteus.magazine' or . = 'application/vnd.publishare-delta-tree' or . = 'application/vnd.pvi.ptid1' or . = 'application/vnd.pwg-multiplexed' or . = 'application/vnd.pwg-xhtml-print+xml' or . = 'application/vnd.qualcomm.brew-app-res' or . = 'application/vnd.Quark.QuarkXPress' or . = 'application/vnd.rapid' or . = 'application/vnd.recordare.musicxml' or . = 'application/vnd.recordare.musicxml+xml' or . = 'application/vnd.RenLearn.rlprint' or . = 'application/vnd.ruckus.download' or . = 'application/vnd.s3sms' or . = 'application/vnd.sbm.mid2' or . = 'application/vnd.scribus' or . = 'application/vnd.sealed.3df' or . = 'application/vnd.sealed.csf' or . = 'application/vnd.sealed.doc' or . = 'application/vnd.sealed.eml' or . = 'application/vnd.sealed.mht' or . = 'application/vnd.sealed.net' or . = 'application/vnd.sealed.ppt' or . = 'application/vnd.sealed.tiff' or . = 'application/vnd.sealed.xls' or . = 'application/vnd.sealedmedia.softseal.html' or . = 'application/vnd.sealedmedia.softseal.pdf' or . = 'application/vnd.seemail' or . = 'application/vnd.sema' or . = 'application/vnd.semd' or . = 'application/vnd.semf' or . = 'application/vnd.shana.informed.formdata' or . = 'application/vnd.shana.informed.formtemplate' or . = 'application/vnd.shana.informed.interchange' or . = 'application/vnd.shana.informed.package' or . = 'application/vnd.SimTech-MindMapper' or . = 'application/vnd.smaf' or . = 'application/vnd.solent.sdkm+xml' or . = 'application/vnd.spotfire.dxp' or . = 'application/vnd.spotfire.sfs' or . = 'application/vnd.sss-cod' or . = 'application/vnd.sss-dtf' or . = 'application/vnd.sss-ntf' or . = 'application/vnd.street-stream' or . = 'application/vnd.sun.wadl+xml' or . = 'application/vnd.sus-calendar' or . = 'application/vnd.svd' or . = 'application/vnd.swiftview-ics' or . = 'application/vnd.syncml.dm+wbxml' or . = 'application/vnd.syncml.dm+xml' or . = 'application/vnd.syncml.ds.notification' or . = 'application/vnd.syncml+xml' or . = 'application/vnd.tao.intent-module-archive' or . = 'application/vnd.tmobile-livetv' or . = 'application/vnd.trid.tpt' or . = 'application/vnd.triscape.mxs' or . = 'application/vnd.trueapp' or . = 'application/vnd.truedoc' or . = 'application/vnd.ufdl' or . = 'application/vnd.uiq.theme' or . = 'application/vnd.umajin' or . = 'application/vnd.unity' or . = 'application/vnd.uoml+xml' or . = 'application/vnd.uplanet.alert' or . = 'application/vnd.uplanet.alert-wbxml' or . = 'application/vnd.uplanet.bearer-choice' or . = 'application/vnd.uplanet.bearer-choice-wbxml' or . = 'application/vnd.uplanet.cacheop' or . = 'application/vnd.uplanet.cacheop-wbxml' or . = 'application/vnd.uplanet.channel' or . = 'application/vnd.uplanet.channel-wbxml' or . = 'application/vnd.uplanet.list' or . = 'application/vnd.uplanet.listcmd' or . = 'application/vnd.uplanet.listcmd-wbxml' or . = 'application/vnd.uplanet.list-wbxml' or . = 'application/vnd.uplanet.signal' or . = 'application/vnd.vcx' or . = 'application/vnd.vectorworks' or . = 'application/vnd.vd-study' or . = 'application/vnd.vidsoft.vidconference' or . = 'application/vnd.visio' or . = 'application/vnd.visionary' or . = 'application/vnd.vividence.scriptfile' or . = 'application/vnd.vsf' or . = 'application/vnd.wap.sic' or . = 'application/vnd.wap.slc' or . = 'application/vnd.wap.wbxml' or . = 'application/vnd.wap.wmlc' or . = 'application/vnd.wap.wmlscriptc' or . = 'application/vnd.webturbo' or . = 'application/vnd.wfa.wsc' or . = 'application/vnd.wmc' or . = 'application/vnd.wmf.bootstrap' or . = 'application/vnd.wordperfect' or . = 'application/vnd.wqd' or . = 'application/vnd.wrq-hp3000-labelled' or . = 'application/vnd.wt.stf' or . = 'application/vnd.wv.csp+xml' or . = 'application/vnd.wv.csp+wbxml' or . = 'application/vnd.wv.ssp+xml' or . = 'application/vnd.xara' or . = 'application/vnd.xfdl' or . = 'application/vnd.xmpie.cpkg' or . = 'application/vnd.xmpie.dpkg' or . = 'application/vnd.xmpie.plan' or . = 'application/vnd.xmpie.ppkg' or . = 'application/vnd.xmpie.xlim' or . = 'application/vnd.yamaha.hv-dic' or . = 'application/vnd.yamaha.hv-script' or . = 'application/vnd.yamaha.hv-voice' or . = 'application/vnd.yamaha.smaf-audio' or . = 'application/vnd.yamaha.smaf-phrase' or . = 'application/vnd.yellowriver-custom-menu' or . = 'application/vnd.zzazz.deck+xml' or . = 'application/voicexml+xml' or . = 'application/watcherinfo+xml' or . = 'application/whoispp-query' or . = 'application/whoispp-response' or . = 'application/wita' or . = 'application/wordperfect5.1' or . = 'application/wsdl+xml' or . = 'application/wspolicy+xml' or . = 'application/x400-bp' or . = 'application/xcap-att+xml' or . = 'application/xcap-caps+xml' or . = 'application/xcap-el+xml' or . = 'application/xcap-error+xml' or . = 'application/xcap-ns+xml' or . = 'application/xenc+xml' or . = 'application/xhtml-voice+xml (Obsolete)' or . = 'application/xhtml+xml' or . = 'application/xml' or . = 'application/xml-dtd' or . = 'application/xml-external-parsed-entity' or . = 'application/xmpp+xml' or . = 'application/xop+xml' or . = 'application/xv+xml' or . = 'application/zip' or . = 'audio/32kadpcm' or . = 'audio/3gpp' or . = 'audio/3gpp2' or . = 'audio/ac3' or . = 'audio/AMR' or . = 'audio/AMR-WB' or . = 'audio/amr-wb+' or . = 'audio/asc' or . = 'audio/basic' or . = 'audio/BV16' or . = 'audio/BV32' or . = 'audio/clearmode' or . = 'audio/CN' or . = 'audio/DAT12' or . = 'audio/dls' or . = 'audio/dsr-es201108' or . = 'audio/dsr-es202050' or . = 'audio/dsr-es202211' or . = 'audio/dsr-es202212' or . = 'audio/eac3' or . = 'audio/DVI4' or . = 'audio/EVRC' or . = 'audio/EVRC0' or . = 'audio/EVRC1' or . = 'audio/EVRCB' or . = 'audio/EVRCB0' or . = 'audio/EVRCB1' or . = 'audio/EVRC-QCP' or . = 'audio/EVRCWB' or . = 'audio/EVRCWB0' or . = 'audio/EVRCWB1' or . = 'audio/example' or . = 'audio/G722' or . = 'audio/G7221' or . = 'audio/G723' or . = 'audio/G726-16' or . = 'audio/G726-24' or . = 'audio/G726-32' or . = 'audio/G726-40' or . = 'audio/G728' or . = 'audio/G729' or . = 'audio/G7291' or . = 'audio/G729D' or . = 'audio/G729E' or . = 'audio/GSM' or . = 'audio/GSM-EFR' or . = 'audio/iLBC' or . = 'audio/L8' or . = 'audio/L16' or . = 'audio/L20' or . = 'audio/L24' or . = 'audio/LPC' or . = 'audio/mobile-xmf' or . = 'audio/MPA' or . = 'audio/mp4' or . = 'audio/MP4A-LATM' or . = 'audio/mpa-robust' or . = 'audio/mpeg' or . = 'audio/mpeg4-generic' or . = 'audio/parityfec' or . = 'audio/PCMA' or . = 'audio/PCMU' or . = 'audio/prs.sid' or . = 'audio/QCELP' or . = 'audio/RED' or . = 'audio/rtp-enc-aescm128' or . = 'audio/rRFC2045tp-midi' or . = 'audio/rtx' or . = 'audio/SMV' or . = 'audio/SMV0' or . = 'audio/SMV-QCP' or . = 'audio/sp-midi' or . = 'audio/t140c' or . = 'audio/t38' or . = 'audio/telephone-event' or . = 'audio/tone' or . = 'audio/ulpfec' or . = 'audio/VDVI' or . = 'audio/VMR-WB' or . = 'audio/vnd.3gpp.iufp' or . = 'audio/vnd.4SB' or . = 'audio/vnd.audiokoz' or . = 'audio/vnd.CELP' or . = 'audio/vnd.cisco.nse' or . = 'audio/vnd.cmles.radio-events' or . = 'audio/vnd.cns.anp1' or . = 'audio/vnd.cns.inf1' or . = 'audio/vnd.digital-winds' or . = 'audio/vnd.dlna.adts' or . = 'audio/vnd.dolby.mlp' or . = 'audio/vnd.everad.plj' or . = 'audio/vnd.hns.audio' or . = 'audio/vnd.lucent.voice' or . = 'audio/vnd.nokia.mobile-xmf' or . = 'audio/vnd.nortel.vbk' or . = 'audio/vnd.nuera.ecelp4800' or . = 'audio/vnd.nuera.ecelp7470' or . = 'audio/vnd.nuera.ecelp9600' or . = 'audio/vnd.octel.sbc' or . = 'audio/vnd.qcelp - DEPRECATED - Please use audio/qcelp' or . = 'audio/vnd.rhetorex.32kadpcm' or . = 'audio/vnd.sealedmedia.softseal.mpeg' or . = 'audio/vnd.vmx.cvsd' or . = 'image/cgm' or . = 'image/example' or . = 'image/fits' or . = 'image/g3fax' or . = 'image/gif' or . = 'image/ief' or . = 'image/jp2' or . = 'image/jpeg' or . = 'image/jpm' or . = 'image/jpx' or . = 'image/naplps' or . = 'image/png' or . = 'image/prs.btif' or . = 'image/prs.pti' or . = 'image/t38' or . = 'image/tiff' or . = 'image/tiff-fx' or . = 'image/vnd.adobe.photoshop' or . = 'image/vnd.cns.inf2' or . = 'image/vnd.djvu' or . = 'image/vnd.dwg' or . = 'image/vnd.dxf' or . = 'image/vnd.fastbidsheet' or . = 'image/vnd.fpx' or . = 'image/vnd.fst' or . = 'image/vnd.fujixerox.edmics-mmr' or . = 'image/vnd.fujixerox.edmics-rlc' or . = 'image/vnd.globalgraphics.pgb' or . = 'image/vnd.microsoft.icon' or . = 'image/vnd.mix' or . = 'image/vnd.ms-modi' or . = 'image/vnd.net-fpx' or . = 'image/vnd.sealed.png' or . = 'image/vnd.sealedmedia.softseal.gif' or . = 'image/vnd.sealedmedia.softseal.jpg' or . = 'image/vnd.svf' or . = 'image/vnd.wap.wbmp' or . = 'image/vnd.xiff' or . = 'message/CPIM' or . = 'message/delivery-status' or . = 'message/disposition-notification' or . = 'message/example' or . = 'message/external-body' or . = 'message/http' or . = 'message/news' or . = 'message/partial' or . = 'message/rfc822' or . = 'message/s-http' or . = 'message/sip' or . = 'message/sipfrag' or . = 'message/tracking-status' or . = 'message/vnd.si.simp' or . = 'model/example' or . = 'model/iges' or . = 'model/mesh' or . = 'model/vnd.dwf' or . = 'model/vnd.flatland.3dml' or . = 'model/vnd.gdl' or . = 'model/vnd.gs-gdl' or . = 'model/vnd.gtw' or . = 'model/vnd.moml+xml' or . = 'model/vnd.mts' or . = 'model/vnd.parasolid.transmit.binary' or . = 'model/vnd.parasolid.transmit.text' or . = 'model/vnd.vtu' or . = 'model/vrml' or . = 'multipart/alternative' or . = 'multipart/appledouble' or . = 'multipart/byteranges' or . = 'multipart/digest' or . = 'multipart/encrypted' or . = 'multipart/example' or . = 'multipart/form-data' or . = 'multipart/header-set' or . = 'multipart/mixed' or . = 'multipart/parallel' or . = 'multipart/related' or . = 'multipart/report' or . = 'multipart/signed' or . = 'multipart/voice-message' or . = 'text/calendar' or . = 'text/css' or . = 'text/csv' or . = 'text/directory' or . = 'text/dns' or . = 'text/ecmascript (obsolete)' or . = 'text/enriched' or . = 'text/example' or . = 'text/html' or . = 'text/javascript (obsolete)' or . = 'text/parityfec' or . = 'text/plain' or . = 'text/prs.fallenstein.rst' or . = 'text/prs.lines.tag' or . = 'text/RED' or . = 'text/rfc822-headers' or . = 'text/richtext' or . = 'text/rtf' or . = 'text/rtp-enc-aescm128' or . = 'text/rtx' or . = 'text/sgml' or . = 'text/t140' or . = 'text/tab-separated-values' or . = 'text/troff' or . = 'text/ulpfec' or . = 'text/uri-list' or . = 'text/vnd.abc' or . = 'text/vnd.curl' or . = 'text/vnd.DMClientScript' or . = 'text/vnd.esmertec.theme-descriptor' or . = 'text/vnd.fly' or . = 'text/vnd.fmi.flexstor' or . = 'text/vnd.in3d.3dml' or . = 'text/vnd.in3d.spot' or . = 'text/vnd.IPTC.NewsML' or . = 'text/vnd.IPTC.NITF' or . = 'text/vnd.latex-z' or . = 'text/vnd.motorola.reflex' or . = 'text/vnd.ms-mediapackage' or . = 'text/vnd.net2phone.commcenter.command' or . = 'text/vnd.si.uricatalogue' or . = 'text/vnd.sun.j2me.app-descriptor' or . = 'text/vnd.trolltech.linguist' or . = 'text/vnd.wap.si' or . = 'text/vnd.wap.sl' or . = 'text/vnd.wap.wml' or . = 'text/vnd.wap.wmlscript' or . = 'text/xml' or . = 'text/xml-external-parsed-entity' or . = 'video/3gpp' or . = 'video/3gpp2' or . = 'video/3gpp-tt' or . = 'video/BMPEG' or . = 'video/BT656' or . = 'video/CelB' or . = 'video/DV' or . = 'video/example' or . = 'video/H261' or . = 'video/H263' or . = 'video/H263-1998' or . = 'video/H263-2000' or . = 'video/H264' or . = 'video/JPEG' or . = 'video/MJ2' or . = 'video/MP1S' or . = 'video/MP2P' or . = 'video/MP2T' or . = 'video/mp4' or . = 'video/MP4V-ES' or . = 'video/MPV' or . = 'video/mpeg' or . = 'video/mpeg4-generic' or . = 'video/nv' or . = 'video/parityfec' or . = 'video/pointer' or . = 'video/quicktime' or . = 'video/raw' or . = 'video/rtp-enc-aescm128' or . = 'video/rtx' or . = 'video/SMPTE292M' or . = 'video/ulpfec' or . = 'video/vc1' or . = 'video/vnd.dlna.mpeg-tts' or . = 'video/vnd.fvt' or . = 'video/vnd.hns.video' or . = 'video/vnd.iptvforum.1dparityfec-1010' or . = 'video/vnd.iptvforum.1dparityfec-2005' or . = 'video/vnd.iptvforum.2dparityfec-1010' or . = 'video/vnd.iptvforum.2dparityfec-2005' or . = 'video/vnd.iptvforum.ttsavc' or . = 'video/vnd.iptvforum.ttsmpeg2' or . = 'video/vnd.motorola.video' or . = 'video/vnd.motorola.videop' or . = 'video/vnd.mpegurl' or . = 'video/vnd.nokia.interleaved-multimedia' or . = 'video/vnd.nokia.videovoip' or . = 'video/vnd.objectvideo' or . = 'video/vnd.sealed.mpeg1' or . = 'video/vnd.sealed.mpeg4' or . = 'video/vnd.sealed.swf' or . = 'video/vnd.sealedmedia.softseal.mov' or . = 'video/vnd.vivo' ) )"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="( ( . = 'application/activemessage' or . = 'application/andrew-inset' or . = 'application/applefile' or . = 'application/atom+xml' or . = 'application/atomicmail' or . = 'application/atomcat+xml' or . = 'application/atomsvc+xml' or . = 'application/auth-policy+xml' or . = 'application/batch-SMTP' or . = 'application/beep+xml' or . = 'application/cals-1840' or . = 'application/ccxml+xml' or . = 'application/cellml+xml' or . = 'application/cnrp+xml' or . = 'application/commonground' or . = 'application/conference-info+xml' or . = 'application/cpl+xml' or . = 'application/csta+xml' or . = 'application/CSTAdata+xml' or . = 'application/cybercash' or . = 'application/davmount+xml' or . = 'application/dca-rft' or . = 'application/dec-dx' or . = 'application/dialog-info+xml' or . = 'application/dicom' or . = 'application/dns' or . = 'application/dvcs' or . = 'application/ecmascript' or . = 'application/EDI-Consent' or . = 'application/EDIFACT' or . = 'application/EDI-X12' or . = 'application/epp+xml' or . = 'application/eshop' or . = 'application/example' or . = 'application/fastinfoset' or . = 'application/fastsoap' or . = 'application/fits' or . = 'application/font-tdpfr' or . = 'application/H224' or . = 'application/http' or . = 'application/hyperstudio' or . = 'application/iges' or . = 'application/im-iscomposing+xml' or . = 'application/index' or . = 'application/index.cmd' or . = 'application/index.obj' or . = 'application/index.response' or . = 'application/index.vnd' or . = 'application/iotp' or . = 'application/ipp' or . = 'application/isup' or . = 'application/javascript' or . = 'application/json' or . = 'application/kpml-request+xml' or . = 'application/kpml-response+xml' or . = 'application/mac-binhex40' or . = 'application/macwriteii' or . = 'application/marc' or . = 'application/mathematica' or . = 'application/mbms-associated-procedure-description+xml' or . = 'application/mbms-deregister+xml' or . = 'application/mbms-envelope+xml' or . = 'application/mbms-msk-response+xml' or . = 'application/mbms-msk+xml' or . = 'application/mbms-protection-description+xml' or . = 'application/mbms-reception-report+xml' or . = 'application/mbms-register-response+xml' or . = 'application/mbms-register+xml' or . = 'application/mbms-user-service-description+xml' or . = 'application/mbox' or . = 'application/media_control+xml' or . = 'application/mediaservercontrol+xml' or . = 'application/mikey' or . = 'application/moss-keys' or . = 'application/moss-signature' or . = 'application/mosskey-data' or . = 'application/mosskey-request' or . = 'application/mpeg4-generic' or . = 'application/mpeg4-iod' or . = 'application/mpeg4-iod-xmt' or . = 'application/mp4' or . = 'application/msword' or . = 'application/mxf' or . = 'application/nasdata' or . = 'application/news-message-id' or . = 'application/news-transmission' or . = 'application/nss' or . = 'application/ocsp-request' or . = 'application/ocsp-response' or . = 'application/octet-stream' or . = 'application/oda' or . = 'application/oebps-package+xml' or . = 'application/ogg' or . = 'application/parityfec' or . = 'application/pdf' or . = 'application/pgp-encrypted' or . = 'application/pgp-keys' or . = 'application/pgp-signature' or . = 'application/pidf+xml' or . = 'application/pkcs10' or . = 'application/pkcs7-mime' or . = 'application/pkcs7-signature' or . = 'application/pkix-cert' or . = 'application/pkixcmp' or . = 'application/pkix-crl' or . = 'application/pkix-pkipath' or . = 'application/pls+xml' or . = 'application/poc-settings+xml' or . = 'application/postscript' or . = 'application/prs.alvestrand.titrax-sheet' or . = 'application/prs.cww' or . = 'application/prs.nprend' or . = 'application/prs.plucker' or . = 'application/rdf+xml' or . = 'application/qsig' or . = 'application/reginfo+xml' or . = 'application/relax-ng-compact-syntax' or . = 'application/remote-printing' or . = 'application/resource-lists+xml' or . = 'application/riscos' or . = 'application/rlmi+xml' or . = 'application/rls-services+xml' or . = 'application/rtf' or . = 'application/rtx' or . = 'application/samlassertion+xml' or . = 'application/samlmetadata+xml' or . = 'application/sbml+xml' or . = 'application/scvp-cv-request' or . = 'application/scvp-cv-response' or . = 'application/scvp-vp-request' or . = 'application/scvp-vp-response' or . = 'application/sdp' or . = 'application/set-payment' or . = 'application/set-payment-initiation' or . = 'application/set-registration' or . = 'application/set-registration-initiation' or . = 'application/sgml' or . = 'application/sgml-open-catalog' or . = 'application/shf+xml' or . = 'application/sieve' or . = 'application/simple-filter+xml' or . = 'application/simple-message-summary' or . = 'application/simpleSymbolContainer' or . = 'application/slate' or . = 'application/smil (OBSOLETE)' or . = 'application/smil+xml' or . = 'application/soap+fastinfoset' or . = 'application/soap+xml' or . = 'application/sparql-query' or . = 'application/sparql-results+xml' or . = 'application/spirits-event+xml' or . = 'application/srgs' or . = 'application/srgs+xml' or . = 'application/ssml+xml' or . = 'application/timestamp-query' or . = 'application/timestamp-reply' or . = 'application/tve-trigger' or . = 'application/ulpfec' or . = 'application/vemmi' or . = 'application/vnd.3gpp.bsf+xml' or . = 'application/vnd.3gpp.pic-bw-large' or . = 'application/vnd.3gpp.pic-bw-small' or . = 'application/vnd.3gpp.pic-bw-var' or . = 'application/vnd.3gpp.sms' or . = 'application/vnd.3gpp2.bcmcsinfo+xml' or . = 'application/vnd.3gpp2.sms' or . = 'application/vnd.3gpp2.tcap' or . = 'application/vnd.3M.Post-it-Notes' or . = 'application/vnd.accpac.simply.aso' or . = 'application/vnd.accpac.simply.imp' or . = 'application/vnd.acucobol' or . = 'application/vnd.acucorp' or . = 'application/vnd.adobe.xdp+xml' or . = 'application/vnd.adobe.xfdf' or . = 'application/vnd.aether.imp' or . = 'application/vnd.americandynamics.acc' or . = 'application/vnd.amiga.ami' or . = 'application/vnd.anser-web-certificate-issue-initiation' or . = 'application/vnd.antix.game-component' or . = 'application/vnd.apple.installer+xml' or . = 'application/vnd.audiograph' or . = 'application/vnd.autopackage' or . = 'application/vnd.avistar+xml' or . = 'application/vnd.blueice.multipass' or . = 'application/vnd.bmi' or . = 'application/vnd.businessobjects' or . = 'application/vnd.cab-jscript' or . = 'application/vnd.canon-cpdl' or . = 'application/vnd.canon-lips' or . = 'application/vnd.cendio.thinlinc.clientconf' or . = 'application/vnd.chemdraw+xml' or . = 'application/vnd.chipnuts.karaoke-mmd' or . = 'application/vnd.cinderella' or . = 'application/vnd.cirpack.isdn-ext' or . = 'application/vnd.claymore' or . = 'application/vnd.clonk.c4group' or . = 'application/vnd.commerce-battelle' or . = 'application/vnd.commonspace' or . = 'application/vnd.cosmocaller' or . = 'application/vnd.contact.cmsg' or . = 'application/vnd.crick.clicker' or . = 'application/vnd.crick.clicker.keyboard' or . = 'application/vnd.crick.clicker.palette' or . = 'application/vnd.crick.clicker.template' or . = 'application/vnd.crick.clicker.wordbank' or . = 'application/vnd.criticaltools.wbs+xml' or . = 'application/vnd.ctc-posml' or . = 'application/vnd.ctct.ws+xml' or . = 'application/vnd.cups-pdf' or . = 'application/vnd.cups-postscript' or . = 'application/vnd.cups-ppd' or . = 'application/vnd.cups-raster' or . = 'application/vnd.cups-raw' or . = 'application/vnd.curl' or . = 'application/vnd.cybank' or . = 'application/vnd.data-vision.rdz' or . = 'application/vnd.denovo.fcselayout-link' or . = 'application/vnd.dna' or . = 'application/vnd.dpgraph' or . = 'application/vnd.dreamfactory' or . = 'application/vnd.dvb.esgcontainer' or . = 'application/vnd.dvb.ipdcesgaccess' or . = 'application/vnd.dxr' or . = 'application/vnd.ecdis-update' or . = 'application/vnd.ecowin.chart' or . = 'application/vnd.ecowin.filerequest' or . = 'application/vnd.ecowin.fileupdate' or . = 'application/vnd.ecowin.series' or . = 'application/vnd.ecowin.seriesrequest' or . = 'application/vnd.ecowin.seriesupdate' or . = 'application/vnd.enliven' or . = 'application/vnd.epson.esf' or . = 'application/vnd.epson.msf' or . = 'application/vnd.epson.quickanime' or . = 'application/vnd.epson.salt' or . = 'application/vnd.epson.ssf' or . = 'application/vnd.ericsson.quickcall' or . = 'application/vnd.eszigno3+xml' or . = 'application/vnd.eudora.data' or . = 'application/vnd.ezpix-album' or . = 'application/vnd.ezpix-package' or . = 'application/vnd.fdf' or . = 'application/vnd.ffsns' or . = 'application/vnd.fints' or . = 'application/vnd.FloGraphIt' or . = 'application/vnd.fluxtime.clip' or . = 'application/vnd.framemaker' or . = 'application/vnd.frogans.fnc' or . = 'application/vnd.frogans.ltf' or . = 'application/vnd.fsc.weblaunch' or . = 'application/vnd.fujitsu.oasys' or . = 'application/vnd.fujitsu.oasys2' or . = 'application/vnd.fujitsu.oasys3' or . = 'application/vnd.fujitsu.oasysgp' or . = 'application/vnd.fujitsu.oasysprs' or . = 'application/vnd.fujixerox.ART4' or . = 'application/vnd.fujixerox.ART-EX' or . = 'application/vnd.fujixerox.ddd' or . = 'application/vnd.fujixerox.docuworks' or . = 'application/vnd.fujixerox.docuworks.binder' or . = 'application/vnd.fujixerox.HBPL' or . = 'application/vnd.fut-misnet' or . = 'application/vnd.fuzzysheet' or . = 'application/vnd.genomatix.tuxedo' or . = 'application/vnd.google-earth.kml+xml' or . = 'application/vnd.google-earth.kmz' or . = 'application/vnd.grafeq' or . = 'application/vnd.gridmp' or . = 'application/vnd.groove-account' or . = 'application/vnd.groove-help' or . = 'application/vnd.groove-identity-message' or . = 'application/vnd.groove-injector' or . = 'application/vnd.groove-tool-message' or . = 'application/vnd.groove-tool-template' or . = 'application/vnd.groove-vcard' or . = 'application/vnd.HandHeld-Entertainment+xml' or . = 'application/vnd.hbci' or . = 'application/vnd.hcl-bireports' or . = 'application/vnd.hhe.lesson-player' or . = 'application/vnd.hp-HPGL' or . = 'application/vnd.hp-hpid' or . = 'application/vnd.hp-hps' or . = 'application/vnd.hp-jlyt' or . = 'application/vnd.hp-PCL' or . = 'application/vnd.hp-PCLXL' or . = 'application/vnd.httphone' or . = 'application/vnd.hzn-3d-crossword' or . = 'application/vnd.ibm.afplinedata' or . = 'application/vnd.ibm.electronic-media' or . = 'application/vnd.ibm.MiniPay' or . = 'application/vnd.ibm.modcap' or . = 'application/vnd.ibm.rights-management' or . = 'application/vnd.ibm.secure-container' or . = 'application/vnd.iccprofile' or . = 'application/vnd.igloader' or . = 'application/vnd.immervision-ivp' or . = 'application/vnd.immervision-ivu' or . = 'application/vnd.informedcontrol.rms+xml' or . = 'application/vnd.informix-visionary' or . = 'application/vnd.intercon.formnet' or . = 'application/vnd.intertrust.digibox' or . = 'application/vnd.intertrust.nncp' or . = 'application/vnd.intu.qbo' or . = 'application/vnd.intu.qfx' or . = 'application/vnd.ipunplugged.rcprofile' or . = 'application/vnd.irepository.package+xml' or . = 'application/vnd.is-xpr' or . = 'application/vnd.jam' or . = 'application/vnd.japannet-directory-service' or . = 'application/vnd.japannet-jpnstore-wakeup' or . = 'application/vnd.japannet-payment-wakeup' or . = 'application/vnd.japannet-registration' or . = 'application/vnd.japannet-registration-wakeup' or . = 'application/vnd.japannet-setstore-wakeup' or . = 'application/vnd.japannet-verification' or . = 'application/vnd.japannet-verification-wakeup' or . = 'application/vnd.jcp.javame.midlet-rms' or . = 'application/vnd.jisp' or . = 'application/vnd.joost.joda-archive' or . = 'application/vnd.kahootz' or . = 'application/vnd.kde.karbon' or . = 'application/vnd.kde.kchart' or . = 'application/vnd.kde.kformula' or . = 'application/vnd.kde.kivio' or . = 'application/vnd.kde.kontour' or . = 'application/vnd.kde.kpresenter' or . = 'application/vnd.kde.kspread' or . = 'application/vnd.kde.kword' or . = 'application/vnd.kenameaapp' or . = 'application/vnd.kidspiration' or . = 'application/vnd.Kinar' or . = 'application/vnd.koan' or . = 'application/vnd.kodak-descriptor' or . = 'application/vnd.liberty-request+xml' or . = 'application/vnd.llamagraphics.life-balance.desktop' or . = 'application/vnd.llamagraphics.life-balance.exchange+xml' or . = 'application/vnd.lotus-1-2-3' or . = 'application/vnd.lotus-approach' or . = 'application/vnd.lotus-freelance' or . = 'application/vnd.lotus-notes' or . = 'application/vnd.lotus-organizer' or . = 'application/vnd.lotus-screencam' or . = 'application/vnd.lotus-wordpro' or . = 'application/vnd.macports.portpkg' or . = 'application/vnd.marlin.drm.actiontoken+xml' or . = 'application/vnd.marlin.drm.conftoken+xml' or . = 'application/vnd.marlin.drm.mdcf' or . = 'application/vnd.mcd' or . = 'application/vnd.medcalcdata' or . = 'application/vnd.mediastation.cdkey' or . = 'application/vnd.meridian-slingshot' or . = 'application/vnd.MFER' or . = 'application/vnd.mfmp' or . = 'application/vnd.micrografx.flo' or . = 'application/vnd.micrografx.igx' or . = 'application/vnd.mif' or . = 'application/vnd.minisoft-hp3000-save' or . = 'application/vnd.mitsubishi.misty-guard.trustweb' or . = 'application/vnd.Mobius.DAF' or . = 'application/vnd.Mobius.DIS' or . = 'application/vnd.Mobius.MBK' or . = 'application/vnd.Mobius.MQY' or . = 'application/vnd.Mobius.MSL' or . = 'application/vnd.Mobius.PLC' or . = 'application/vnd.Mobius.TXF' or . = 'application/vnd.mophun.application' or . = 'application/vnd.mophun.certificate' or . = 'application/vnd.motorola.flexsuite' or . = 'application/vnd.motorola.flexsuite.adsi' or . = 'application/vnd.motorola.flexsuite.fis' or . = 'application/vnd.motorola.flexsuite.gotap' or . = 'application/vnd.motorola.flexsuite.kmr' or . = 'application/vnd.motorola.flexsuite.ttc' or . = 'application/vnd.motorola.flexsuite.wem' or . = 'application/vnd.mozilla.xul+xml' or . = 'application/vnd.ms-artgalry' or . = 'application/vnd.ms-asf' or . = 'application/vnd.ms-cab-compressed' or . = 'application/vnd.mseq' or . = 'application/vnd.ms-excel' or . = 'application/vnd.ms-fontobject' or . = 'application/vnd.ms-htmlhelp' or . = 'application/vnd.msign' or . = 'application/vnd.ms-ims' or . = 'application/vnd.ms-lrm' or . = 'application/vnd.ms-playready.initiator+xml' or . = 'application/vnd.ms-powerpoint' or . = 'application/vnd.ms-project' or . = 'application/vnd.ms-tnef' or . = 'application/vnd.ms-wmdrm.lic-chlg-req' or . = 'application/vnd.ms-wmdrm.lic-resp' or . = 'application/vnd.ms-wmdrm.meter-chlg-req' or . = 'application/vnd.ms-wmdrm.meter-resp' or . = 'application/vnd.ms-works' or . = 'application/vnd.ms-wpl' or . = 'application/vnd.ms-xpsdocument' or . = 'application/vnd.multiad.creator' or . = 'application/vnd.multiad.creator.cif' or . = 'application/vnd.musician' or . = 'application/vnd.music-niff' or . = 'application/vnd.muvee.style' or . = 'application/vnd.ncd.control' or . = 'application/vnd.ncd.reference' or . = 'application/vnd.nervana' or . = 'application/vnd.netfpx' or . = 'application/vnd.neurolanguage.nlu' or . = 'application/vnd.noblenet-directory' or . = 'application/vnd.noblenet-sealer' or . = 'application/vnd.noblenet-web' or . = 'application/vnd.nokia.catalogs' or . = 'application/vnd.nokia.conml+wbxml' or . = 'application/vnd.nokia.conml+xml' or . = 'application/vnd.nokia.iptv.config+xml' or . = 'application/vnd.nokia.iSDS-radio-presets' or . = 'application/vnd.nokia.landmark+wbxml' or . = 'application/vnd.nokia.landmark+xml' or . = 'application/vnd.nokia.landmarkcollection+xml' or . = 'application/vnd.nokia.ncd' or . = 'application/vnd.nokia.n-gage.ac+xml' or . = 'application/vnd.nokia.n-gage.data' or . = 'application/vnd.nokia.n-gage.symbian.install' or . = 'application/vnd.nokia.pcd+wbxml' or . = 'application/vnd.nokia.pcd+xml' or . = 'application/vnd.nokia.radio-preset' or . = 'application/vnd.nokia.radio-presets' or . = 'application/vnd.novadigm.EDM' or . = 'application/vnd.novadigm.EDX' or . = 'application/vnd.novadigm.EXT' or . = 'application/vnd.oasis.opendocument.chart' or . = 'application/vnd.oasis.opendocument.chart-template' or . = 'application/vnd.oasis.opendocument.formula' or . = 'application/vnd.oasis.opendocument.formula-template' or . = 'application/vnd.oasis.opendocument.graphics' or . = 'application/vnd.oasis.opendocument.graphics-template' or . = 'application/vnd.oasis.opendocument.image' or . = 'application/vnd.oasis.opendocument.image-template' or . = 'application/vnd.oasis.opendocument.presentation' or . = 'application/vnd.oasis.opendocument.presentation-template' or . = 'application/vnd.oasis.opendocument.spreadsheet' or . = 'application/vnd.oasis.opendocument.spreadsheet-template' or . = 'application/vnd.oasis.opendocument.text' or . = 'application/vnd.oasis.opendocument.text-master' or . = 'application/vnd.oasis.opendocument.text-template' or . = 'application/vnd.oasis.opendocument.text-web' or . = 'application/vnd.obn' or . = 'application/vnd.olpc-sugar' or . = 'application/vnd.oma.bcast.associated-procedure-parameter+xml' or . = 'application/vnd.oma.bcast.drm-trigger+xml' or . = 'application/vnd.oma.bcast.imd+xml' or . = 'application/vnd.oma.bcast.ltkm' or . = 'application/vnd.oma.bcast.notification+xml' or . = 'application/vnd.oma.bcast.sgboot' or . = 'application/vnd.oma.bcast.sgdd+xml' or . = 'application/vnd.oma.bcast.sgdu' or . = 'application/vnd.oma.bcast.simple-symbol-container' or . = 'application/vnd.oma.bcast.smartcard-trigger+xml' or . = 'application/vnd.oma.bcast.sprov+xml' or . = 'application/vnd.oma.bcast.stkm' or . = 'application/vnd.oma.dd2+xml' or . = 'application/vnd.oma.drm.risd+xml' or . = 'application/vnd.oma.group-usage-list+xml' or . = 'application/vnd.oma.poc.detailed-progress-report+xml' or . = 'application/vnd.oma.poc.final-report+xml' or . = 'application/vnd.oma.poc.groups+xml' or . = 'application/vnd.oma.poc.invocation-descriptor+xml' or . = 'application/vnd.oma.poc.optimized-progress-report+xml' or . = 'application/vnd.oma.xcap-directory+xml' or . = 'application/vnd.omads-email+xml' or . = 'application/vnd.omads-file+xml' or . = 'application/vnd.omads-folder+xml' or . = 'application/vnd.omaloc-supl-init' or . = 'application/vnd.oma-scws-config' or . = 'application/vnd.oma-scws-http-request' or . = 'application/vnd.oma-scws-http-response' or . = 'application/vnd.openofficeorg.extension' or . = 'application/vnd.osa.netdeploy' or . = 'application/vnd.osgi.bundle' or . = 'application/vnd.osgi.dp' or . = 'application/vnd.otps.ct-kip+xml' or . = 'application/vnd.palm' or . = 'application/vnd.paos.xml' or . = 'application/vnd.pg.format' or . = 'application/vnd.pg.osasli' or . = 'application/vnd.piaccess.application-licence' or . = 'application/vnd.picsel' or . = 'application/vnd.poc.group-advertisement+xml' or . = 'application/vnd.pocketlearn' or . = 'application/vnd.powerbuilder6' or . = 'application/vnd.powerbuilder6-s' or . = 'application/vnd.powerbuilder7' or . = 'application/vnd.powerbuilder75' or . = 'application/vnd.powerbuilder75-s' or . = 'application/vnd.powerbuilder7-s' or . = 'application/vnd.preminet' or . = 'application/vnd.previewsystems.box' or . = 'application/vnd.proteus.magazine' or . = 'application/vnd.publishare-delta-tree' or . = 'application/vnd.pvi.ptid1' or . = 'application/vnd.pwg-multiplexed' or . = 'application/vnd.pwg-xhtml-print+xml' or . = 'application/vnd.qualcomm.brew-app-res' or . = 'application/vnd.Quark.QuarkXPress' or . = 'application/vnd.rapid' or . = 'application/vnd.recordare.musicxml' or . = 'application/vnd.recordare.musicxml+xml' or . = 'application/vnd.RenLearn.rlprint' or . = 'application/vnd.ruckus.download' or . = 'application/vnd.s3sms' or . = 'application/vnd.sbm.mid2' or . = 'application/vnd.scribus' or . = 'application/vnd.sealed.3df' or . = 'application/vnd.sealed.csf' or . = 'application/vnd.sealed.doc' or . = 'application/vnd.sealed.eml' or . = 'application/vnd.sealed.mht' or . = 'application/vnd.sealed.net' or . = 'application/vnd.sealed.ppt' or . = 'application/vnd.sealed.tiff' or . = 'application/vnd.sealed.xls' or . = 'application/vnd.sealedmedia.softseal.html' or . = 'application/vnd.sealedmedia.softseal.pdf' or . = 'application/vnd.seemail' or . = 'application/vnd.sema' or . = 'application/vnd.semd' or . = 'application/vnd.semf' or . = 'application/vnd.shana.informed.formdata' or . = 'application/vnd.shana.informed.formtemplate' or . = 'application/vnd.shana.informed.interchange' or . = 'application/vnd.shana.informed.package' or . = 'application/vnd.SimTech-MindMapper' or . = 'application/vnd.smaf' or . = 'application/vnd.solent.sdkm+xml' or . = 'application/vnd.spotfire.dxp' or . = 'application/vnd.spotfire.sfs' or . = 'application/vnd.sss-cod' or . = 'application/vnd.sss-dtf' or . = 'application/vnd.sss-ntf' or . = 'application/vnd.street-stream' or . = 'application/vnd.sun.wadl+xml' or . = 'application/vnd.sus-calendar' or . = 'application/vnd.svd' or . = 'application/vnd.swiftview-ics' or . = 'application/vnd.syncml.dm+wbxml' or . = 'application/vnd.syncml.dm+xml' or . = 'application/vnd.syncml.ds.notification' or . = 'application/vnd.syncml+xml' or . = 'application/vnd.tao.intent-module-archive' or . = 'application/vnd.tmobile-livetv' or . = 'application/vnd.trid.tpt' or . = 'application/vnd.triscape.mxs' or . = 'application/vnd.trueapp' or . = 'application/vnd.truedoc' or . = 'application/vnd.ufdl' or . = 'application/vnd.uiq.theme' or . = 'application/vnd.umajin' or . = 'application/vnd.unity' or . = 'application/vnd.uoml+xml' or . = 'application/vnd.uplanet.alert' or . = 'application/vnd.uplanet.alert-wbxml' or . = 'application/vnd.uplanet.bearer-choice' or . = 'application/vnd.uplanet.bearer-choice-wbxml' or . = 'application/vnd.uplanet.cacheop' or . = 'application/vnd.uplanet.cacheop-wbxml' or . = 'application/vnd.uplanet.channel' or . = 'application/vnd.uplanet.channel-wbxml' or . = 'application/vnd.uplanet.list' or . = 'application/vnd.uplanet.listcmd' or . = 'application/vnd.uplanet.listcmd-wbxml' or . = 'application/vnd.uplanet.list-wbxml' or . = 'application/vnd.uplanet.signal' or . = 'application/vnd.vcx' or . = 'application/vnd.vectorworks' or . = 'application/vnd.vd-study' or . = 'application/vnd.vidsoft.vidconference' or . = 'application/vnd.visio' or . = 'application/vnd.visionary' or . = 'application/vnd.vividence.scriptfile' or . = 'application/vnd.vsf' or . = 'application/vnd.wap.sic' or . = 'application/vnd.wap.slc' or . = 'application/vnd.wap.wbxml' or . = 'application/vnd.wap.wmlc' or . = 'application/vnd.wap.wmlscriptc' or . = 'application/vnd.webturbo' or . = 'application/vnd.wfa.wsc' or . = 'application/vnd.wmc' or . = 'application/vnd.wmf.bootstrap' or . = 'application/vnd.wordperfect' or . = 'application/vnd.wqd' or . = 'application/vnd.wrq-hp3000-labelled' or . = 'application/vnd.wt.stf' or . = 'application/vnd.wv.csp+xml' or . = 'application/vnd.wv.csp+wbxml' or . = 'application/vnd.wv.ssp+xml' or . = 'application/vnd.xara' or . = 'application/vnd.xfdl' or . = 'application/vnd.xmpie.cpkg' or . = 'application/vnd.xmpie.dpkg' or . = 'application/vnd.xmpie.plan' or . = 'application/vnd.xmpie.ppkg' or . = 'application/vnd.xmpie.xlim' or . = 'application/vnd.yamaha.hv-dic' or . = 'application/vnd.yamaha.hv-script' or . = 'application/vnd.yamaha.hv-voice' or . = 'application/vnd.yamaha.smaf-audio' or . = 'application/vnd.yamaha.smaf-phrase' or . = 'application/vnd.yellowriver-custom-menu' or . = 'application/vnd.zzazz.deck+xml' or . = 'application/voicexml+xml' or . = 'application/watcherinfo+xml' or . = 'application/whoispp-query' or . = 'application/whoispp-response' or . = 'application/wita' or . = 'application/wordperfect5.1' or . = 'application/wsdl+xml' or . = 'application/wspolicy+xml' or . = 'application/x400-bp' or . = 'application/xcap-att+xml' or . = 'application/xcap-caps+xml' or . = 'application/xcap-el+xml' or . = 'application/xcap-error+xml' or . = 'application/xcap-ns+xml' or . = 'application/xenc+xml' or . = 'application/xhtml-voice+xml (Obsolete)' or . = 'application/xhtml+xml' or . = 'application/xml' or . = 'application/xml-dtd' or . = 'application/xml-external-parsed-entity' or . = 'application/xmpp+xml' or . = 'application/xop+xml' or . = 'application/xv+xml' or . = 'application/zip' or . = 'audio/32kadpcm' or . = 'audio/3gpp' or . = 'audio/3gpp2' or . = 'audio/ac3' or . = 'audio/AMR' or . = 'audio/AMR-WB' or . = 'audio/amr-wb+' or . = 'audio/asc' or . = 'audio/basic' or . = 'audio/BV16' or . = 'audio/BV32' or . = 'audio/clearmode' or . = 'audio/CN' or . = 'audio/DAT12' or . = 'audio/dls' or . = 'audio/dsr-es201108' or . = 'audio/dsr-es202050' or . = 'audio/dsr-es202211' or . = 'audio/dsr-es202212' or . = 'audio/eac3' or . = 'audio/DVI4' or . = 'audio/EVRC' or . = 'audio/EVRC0' or . = 'audio/EVRC1' or . = 'audio/EVRCB' or . = 'audio/EVRCB0' or . = 'audio/EVRCB1' or . = 'audio/EVRC-QCP' or . = 'audio/EVRCWB' or . = 'audio/EVRCWB0' or . = 'audio/EVRCWB1' or . = 'audio/example' or . = 'audio/G722' or . = 'audio/G7221' or . = 'audio/G723' or . = 'audio/G726-16' or . = 'audio/G726-24' or . = 'audio/G726-32' or . = 'audio/G726-40' or . = 'audio/G728' or . = 'audio/G729' or . = 'audio/G7291' or . = 'audio/G729D' or . = 'audio/G729E' or . = 'audio/GSM' or . = 'audio/GSM-EFR' or . = 'audio/iLBC' or . = 'audio/L8' or . = 'audio/L16' or . = 'audio/L20' or . = 'audio/L24' or . = 'audio/LPC' or . = 'audio/mobile-xmf' or . = 'audio/MPA' or . = 'audio/mp4' or . = 'audio/MP4A-LATM' or . = 'audio/mpa-robust' or . = 'audio/mpeg' or . = 'audio/mpeg4-generic' or . = 'audio/parityfec' or . = 'audio/PCMA' or . = 'audio/PCMU' or . = 'audio/prs.sid' or . = 'audio/QCELP' or . = 'audio/RED' or . = 'audio/rtp-enc-aescm128' or . = 'audio/rRFC2045tp-midi' or . = 'audio/rtx' or . = 'audio/SMV' or . = 'audio/SMV0' or . = 'audio/SMV-QCP' or . = 'audio/sp-midi' or . = 'audio/t140c' or . = 'audio/t38' or . = 'audio/telephone-event' or . = 'audio/tone' or . = 'audio/ulpfec' or . = 'audio/VDVI' or . = 'audio/VMR-WB' or . = 'audio/vnd.3gpp.iufp' or . = 'audio/vnd.4SB' or . = 'audio/vnd.audiokoz' or . = 'audio/vnd.CELP' or . = 'audio/vnd.cisco.nse' or . = 'audio/vnd.cmles.radio-events' or . = 'audio/vnd.cns.anp1' or . = 'audio/vnd.cns.inf1' or . = 'audio/vnd.digital-winds' or . = 'audio/vnd.dlna.adts' or . = 'audio/vnd.dolby.mlp' or . = 'audio/vnd.everad.plj' or . = 'audio/vnd.hns.audio' or . = 'audio/vnd.lucent.voice' or . = 'audio/vnd.nokia.mobile-xmf' or . = 'audio/vnd.nortel.vbk' or . = 'audio/vnd.nuera.ecelp4800' or . = 'audio/vnd.nuera.ecelp7470' or . = 'audio/vnd.nuera.ecelp9600' or . = 'audio/vnd.octel.sbc' or . = 'audio/vnd.qcelp - DEPRECATED - Please use audio/qcelp' or . = 'audio/vnd.rhetorex.32kadpcm' or . = 'audio/vnd.sealedmedia.softseal.mpeg' or . = 'audio/vnd.vmx.cvsd' or . = 'image/cgm' or . = 'image/example' or . = 'image/fits' or . = 'image/g3fax' or . = 'image/gif' or . = 'image/ief' or . = 'image/jp2' or . = 'image/jpeg' or . = 'image/jpm' or . = 'image/jpx' or . = 'image/naplps' or . = 'image/png' or . = 'image/prs.btif' or . = 'image/prs.pti' or . = 'image/t38' or . = 'image/tiff' or . = 'image/tiff-fx' or . = 'image/vnd.adobe.photoshop' or . = 'image/vnd.cns.inf2' or . = 'image/vnd.djvu' or . = 'image/vnd.dwg' or . = 'image/vnd.dxf' or . = 'image/vnd.fastbidsheet' or . = 'image/vnd.fpx' or . = 'image/vnd.fst' or . = 'image/vnd.fujixerox.edmics-mmr' or . = 'image/vnd.fujixerox.edmics-rlc' or . = 'image/vnd.globalgraphics.pgb' or . = 'image/vnd.microsoft.icon' or . = 'image/vnd.mix' or . = 'image/vnd.ms-modi' or . = 'image/vnd.net-fpx' or . = 'image/vnd.sealed.png' or . = 'image/vnd.sealedmedia.softseal.gif' or . = 'image/vnd.sealedmedia.softseal.jpg' or . = 'image/vnd.svf' or . = 'image/vnd.wap.wbmp' or . = 'image/vnd.xiff' or . = 'message/CPIM' or . = 'message/delivery-status' or . = 'message/disposition-notification' or . = 'message/example' or . = 'message/external-body' or . = 'message/http' or . = 'message/news' or . = 'message/partial' or . = 'message/rfc822' or . = 'message/s-http' or . = 'message/sip' or . = 'message/sipfrag' or . = 'message/tracking-status' or . = 'message/vnd.si.simp' or . = 'model/example' or . = 'model/iges' or . = 'model/mesh' or . = 'model/vnd.dwf' or . = 'model/vnd.flatland.3dml' or . = 'model/vnd.gdl' or . = 'model/vnd.gs-gdl' or . = 'model/vnd.gtw' or . = 'model/vnd.moml+xml' or . = 'model/vnd.mts' or . = 'model/vnd.parasolid.transmit.binary' or . = 'model/vnd.parasolid.transmit.text' or . = 'model/vnd.vtu' or . = 'model/vrml' or . = 'multipart/alternative' or . = 'multipart/appledouble' or . = 'multipart/byteranges' or . = 'multipart/digest' or . = 'multipart/encrypted' or . = 'multipart/example' or . = 'multipart/form-data' or . = 'multipart/header-set' or . = 'multipart/mixed' or . = 'multipart/parallel' or . = 'multipart/related' or . = 'multipart/report' or . = 'multipart/signed' or . = 'multipart/voice-message' or . = 'text/calendar' or . = 'text/css' or . = 'text/csv' or . = 'text/directory' or . = 'text/dns' or . = 'text/ecmascript (obsolete)' or . = 'text/enriched' or . = 'text/example' or . = 'text/html' or . = 'text/javascript (obsolete)' or . = 'text/parityfec' or . = 'text/plain' or . = 'text/prs.fallenstein.rst' or . = 'text/prs.lines.tag' or . = 'text/RED' or . = 'text/rfc822-headers' or . = 'text/richtext' or . = 'text/rtf' or . = 'text/rtp-enc-aescm128' or . = 'text/rtx' or . = 'text/sgml' or . = 'text/t140' or . = 'text/tab-separated-values' or . = 'text/troff' or . = 'text/ulpfec' or . = 'text/uri-list' or . = 'text/vnd.abc' or . = 'text/vnd.curl' or . = 'text/vnd.DMClientScript' or . = 'text/vnd.esmertec.theme-descriptor' or . = 'text/vnd.fly' or . = 'text/vnd.fmi.flexstor' or . = 'text/vnd.in3d.3dml' or . = 'text/vnd.in3d.spot' or . = 'text/vnd.IPTC.NewsML' or . = 'text/vnd.IPTC.NITF' or . = 'text/vnd.latex-z' or . = 'text/vnd.motorola.reflex' or . = 'text/vnd.ms-mediapackage' or . = 'text/vnd.net2phone.commcenter.command' or . = 'text/vnd.si.uricatalogue' or . = 'text/vnd.sun.j2me.app-descriptor' or . = 'text/vnd.trolltech.linguist' or . = 'text/vnd.wap.si' or . = 'text/vnd.wap.sl' or . = 'text/vnd.wap.wml' or . = 'text/vnd.wap.wmlscript' or . = 'text/xml' or . = 'text/xml-external-parsed-entity' or . = 'video/3gpp' or . = 'video/3gpp2' or . = 'video/3gpp-tt' or . = 'video/BMPEG' or . = 'video/BT656' or . = 'video/CelB' or . = 'video/DV' or . = 'video/example' or . = 'video/H261' or . = 'video/H263' or . = 'video/H263-1998' or . = 'video/H263-2000' or . = 'video/H264' or . = 'video/JPEG' or . = 'video/MJ2' or . = 'video/MP1S' or . = 'video/MP2P' or . = 'video/MP2T' or . = 'video/mp4' or . = 'video/MP4V-ES' or . = 'video/MPV' or . = 'video/mpeg' or . = 'video/mpeg4-generic' or . = 'video/nv' or . = 'video/parityfec' or . = 'video/pointer' or . = 'video/quicktime' or . = 'video/raw' or . = 'video/rtp-enc-aescm128' or . = 'video/rtx' or . = 'video/SMPTE292M' or . = 'video/ulpfec' or . = 'video/vc1' or . = 'video/vnd.dlna.mpeg-tts' or . = 'video/vnd.fvt' or . = 'video/vnd.hns.video' or . = 'video/vnd.iptvforum.1dparityfec-1010' or . = 'video/vnd.iptvforum.1dparityfec-2005' or . = 'video/vnd.iptvforum.2dparityfec-1010' or . = 'video/vnd.iptvforum.2dparityfec-2005' or . = 'video/vnd.iptvforum.ttsavc' or . = 'video/vnd.iptvforum.ttsmpeg2' or . = 'video/vnd.motorola.video' or . = 'video/vnd.motorola.videop' or . = 'video/vnd.mpegurl' or . = 'video/vnd.nokia.interleaved-multimedia' or . = 'video/vnd.nokia.videovoip' or . = 'video/vnd.objectvideo' or . = 'video/vnd.sealed.mpeg1' or . = 'video/vnd.sealed.mpeg4' or . = 'video/vnd.sealed.swf' or . = 'video/vnd.sealedmedia.softseal.mov' or . = 'video/vnd.vivo' ) )">
               <axsl:attribute name="flag">fatal</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[CL-T10-R008]-For Mime code in attribute use MIMEMediaType.</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>
      <axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M7"/>
   </axsl:template>

	<!--RULE -->

   <axsl:template match="cac:AllowanceCharge//cbc:AllowanceChargeReasonCode" priority="1000" mode="M7">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" context="cac:AllowanceCharge//cbc:AllowanceChargeReasonCode"/>

		<!--ASSERT -->

      <axsl:choose>
         <axsl:when test="( ( not(contains(normalize-space(.),' ')) and contains( ' 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 ',concat(' ',normalize-space(.),' ') ) ) )"/>
         <axsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:schold="http://www.ascc.net/xml/schematron" test="( ( not(contains(normalize-space(.),' ')) and contains( ' 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 ',concat(' ',normalize-space(.),' ') ) ) )">
               <axsl:attribute name="flag">warning</axsl:attribute>
               <axsl:attribute name="location">
                  <axsl:apply-templates select="." mode="schematron-get-full-path"/>
               </axsl:attribute>
               <svrl:text>[CL-T10-R010]-Coded allowance and charge reasons SHOULD belong to the UNCL 4465 code list BII2 subset</svrl:text>
            </svrl:failed-assert>
         </axsl:otherwise>
      </axsl:choose>
      <axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M7"/>
   </axsl:template>
   <axsl:template match="text()" priority="-1" mode="M7"/>
   <axsl:template match="@*|node()" priority="-2" mode="M7">
      <axsl:apply-templates select="@*|*|comment()|processing-instruction()" mode="M7"/>
   </axsl:template>
</axsl:stylesheet>