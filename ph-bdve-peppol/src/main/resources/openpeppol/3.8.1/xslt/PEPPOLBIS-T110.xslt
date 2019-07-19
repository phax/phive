<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:saxon="http://saxon.sf.net/" xmlns:schold="http://www.ascc.net/xml/schematron" xmlns:u="utils" xmlns:ubl="urn:oasis:names:specification:ubl:schema:xsd:OrderResponse-2" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
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
<xsl:function as="xs:boolean" name="u:gln">
      <xsl:param name="val" />
      <xsl:variable name="length" select="string-length($val) - 1" />
      <xsl:variable name="digits" select="reverse(for $i in string-to-codepoints(substring($val, 0, $length + 1)) return $i - 48)" />
      <xsl:variable name="weightedSum" select="sum(for $i in (0 to $length - 1) return $digits[$i + 1] * (1 + ((($i + 1) mod 2) * 2)))" />
      <xsl:value-of select="10 - ($weightedSum mod 10) = number(substring($val, $length + 1, 1))" />
   </xsl:function>
  <xsl:function as="xs:boolean" name="u:slack">
      <xsl:param as="xs:decimal" name="exp" />
      <xsl:param as="xs:decimal" name="val" />
      <xsl:param as="xs:decimal" name="slack" />
      <xsl:value-of select="xs:decimal($exp + $slack) >= $val and xs:decimal($exp - $slack) &lt;= $val" />
   </xsl:function>
  <xsl:function name="u:cat2str">
      <xsl:param name="cat" />
      <xsl:value-of select="concat(normalize-space($cat/cbc:ID), '-', round(xs:decimal($cat/cbc:Percent) * 1000000))" />
   </xsl:function>
  <xsl:function as="xs:boolean" name="u:mod11">
      <xsl:param name="val" />
      <xsl:variable name="length" select="string-length($val) - 1" />
      <xsl:variable name="digits" select="reverse(for $i in string-to-codepoints(substring($val, 0, $length + 1)) return $i - 48)" />
      <xsl:variable name="weightedSum" select="sum(for $i in (0 to $length - 1) return $digits[$i + 1] * (($i mod 6) + 2))" />
      <xsl:value-of select="number($val) > 0 and (11 - ($weightedSum mod 11)) mod 11 = number(substring($val, $length + 1, 1))" />
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
    <svrl:schematron-output schemaVersion="iso" title="Rules for PEPPOL Order Agreement transaction 3.0">
      <xsl:comment>
        <xsl:value-of select="$archiveDirParameter" />   
		 <xsl:value-of select="$archiveNameParameter" />  
		 <xsl:value-of select="$fileNameParameter" />  
		 <xsl:value-of select="$fileDirParameter" />
      </xsl:comment>
      <svrl:ns-prefix-in-attribute-values prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" />
      <svrl:ns-prefix-in-attribute-values prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" />
      <svrl:ns-prefix-in-attribute-values prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:OrderResponse-2" />
      <svrl:ns-prefix-in-attribute-values prefix="xs" uri="http://www.w3.org/2001/XMLSchema" />
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
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M13" select="/" />
    </svrl:schematron-output>
  </xsl:template>

<!--SCHEMATRON PATTERNS-->
<svrl:text>Rules for PEPPOL Order Agreement transaction 3.0</svrl:text>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="cbc:*" mode="M10" priority="1001">
    <svrl:fired-rule context="cbc:*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test=". != ''" />
      <xsl:otherwise>
        <svrl:failed-assert test=". != ''">
          <xsl:attribute name="id">PEPPOL-COMMON-R001</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST not contain empty elements.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:*" mode="M10" priority="1000">
    <svrl:fired-rule context="cac:*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="count(*) != 0" />
      <xsl:otherwise>
        <svrl:failed-assert test="count(*) != 0">
          <xsl:attribute name="id">PEPPOL-COMMON-R002</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST not contain empty elements.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" select="*" />
  </xsl:template>
  <xsl:template match="text()" mode="M10" priority="-1" />
  <xsl:template match="@*|node()" mode="M10" priority="-2">
    <xsl:apply-templates mode="M10" select="*" />
  </xsl:template>

<!--PATTERN -->


	<!--RULE -->
<xsl:template match="/*" mode="M11" priority="1003">
    <svrl:fired-rule context="/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(@*:schemaLocation)" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(@*:schemaLocation)">
          <xsl:attribute name="id">PEPPOL-COMMON-R003</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document SHOULD not contain schema location.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M11" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cbc:IssueDate | cbc:DueDate | cbc:TaxPointDate | cbc:StartDate | cbc:EndDate | cbc:ActualDeliveryDate" mode="M11" priority="1002">
    <svrl:fired-rule context="cbc:IssueDate | cbc:DueDate | cbc:TaxPointDate | cbc:StartDate | cbc:EndDate | cbc:ActualDeliveryDate" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(string(.) castable as xs:date) and (string-length(.) = 10)" />
      <xsl:otherwise>
        <svrl:failed-assert test="(string(.) castable as xs:date) and (string-length(.) = 10)">
          <xsl:attribute name="id">PEPPOL-COMMON-R030</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>A date must be formatted YYYY-MM-DD.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M11" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cbc:EndpointID[@schemeID = '0088'] | cac:PartyIdentification/cbc:ID[@schemeID = '0088'] | cbc:CompanyID[@schemeID = '0088']" mode="M11" priority="1001">
    <svrl:fired-rule context="cbc:EndpointID[@schemeID = '0088'] | cac:PartyIdentification/cbc:ID[@schemeID = '0088'] | cbc:CompanyID[@schemeID = '0088']" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="matches(normalize-space(), '^[0-9]+$') and u:gln(normalize-space())" />
      <xsl:otherwise>
        <svrl:failed-assert test="matches(normalize-space(), '^[0-9]+$') and u:gln(normalize-space())">
          <xsl:attribute name="id">PEPPOL-COMMON-R040</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Invalid GLN number provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M11" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cbc:EndpointID[@schemeID = '0192'] | cac:PartyIdentification/cbc:ID[@schemeID = '0192'] | cbc:CompanyID[@schemeID = '0192']" mode="M11" priority="1000">
    <svrl:fired-rule context="cbc:EndpointID[@schemeID = '0192'] | cac:PartyIdentification/cbc:ID[@schemeID = '0192'] | cbc:CompanyID[@schemeID = '0192']" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="matches(normalize-space(), '^[0-9]{9}$') and u:mod11(normalize-space())" />
      <xsl:otherwise>
        <svrl:failed-assert test="matches(normalize-space(), '^[0-9]{9}$') and u:mod11(normalize-space())">
          <xsl:attribute name="id">PEPPOL-COMMON-R041</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Invalid Norwegian organization number provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M11" select="*" />
  </xsl:template>
  <xsl:template match="text()" mode="M11" priority="-1" />
  <xsl:template match="@*|node()" mode="M11" priority="-2">
    <xsl:apply-templates mode="M11" select="*" />
  </xsl:template>

<!--PATTERN -->
<xsl:variable name="cleas" select="tokenize('0002 0007 0009 0037 0060 0088 0096 0097 0106 0135 0142 0151 0183 0184 0190 0191 0192 0193 0195 0196 0198 0199 0200 0201 0202 9901 9902 9904 9905 9906 9907 9910 9913 9914 9915 9917 9918 9919 9920 9921 9922 9923 9924 9925 9926 9927 9928 9929 9930 9931 9932 9933 9934 9935 9936 9937 9938 9939 9940 9941 9942 9943 9944 9945 9946 9947 9948 9949 9950 9951 9952 9953 9955 9956 9957 9958', '\s')" />
  <xsl:variable name="clTrueFalse" select="tokenize('true false', '\s')" />
  <xsl:variable name="clISO4217" select="tokenize('AED AFN ALL AMD ANG ANG AOA ARS AUD AUD AUD AUD AUD AUD AUD AUD AWG AZN BAM BBD BDT BGN BHD BIF BMD BND BOB BOV BRL BSD BTN BWP BYN BZD CAD CDF CHE CHF CHF CHW CLF CLP CNY COP COU CRC CUC CUP CVE CZK DJF DKK DKK DKK DOP DZD EGP ERN ETB EUR EUR EUR EUR EUR EUR EUR EUR EUR EUR EUR EUR EUR EUR EUR EUR EUR EUR EUR EUR EUR EUR EUR EUR EUR EUR EUR EUR EUR EUR EUR EUR EUR EUR EUR FJD FKP GBP GBP GBP GBP GEL GHS GIP GMD GNF GTQ GYD HKD HNL HRK HTG HUF IDR ILS INR INR IQD IRR ISK JMD JOD JPY KES KGS KHR KMF KPW KRW KWD KYD KZT LAK LBP LKR LRD LSL LYD MAD MAD MDL MGA MKD MMK MNT MOP MRU MUR MVR MWK MXN MXV MYR MZN NAD NGN NIO NOK NOK NOK NPR NZD NZD NZD NZD NZD OMR PAB PEN PGK PHP PKR PLN PYG QAR RON RSD RUB RWF SAR SBD SCR SDG SEK SGD SHP SLL SOS SRD SSP STN SVC SYP SZL THB TJS TMT TND TOP TRY TTD TWD TZS UAH UGX USD USD USD USD USD USD USD USD USD USD USD USD USD USD USD USD USD USD USD USN UYI UYU UZS VEF VND VUV WST XAF XAF XAF XAF XAF XAF XAG XAU XBA XBB XBC XBD XCD XCD XCD XCD XCD XCD XCD XCD XDR XOF XOF XOF XOF XOF XOF XOF XOF XPD XPF XPF XPF XPT XSU XTS XUA YER ZAR ZAR ZAR ZMW ZWL', '\s')" />
  <xsl:variable name="clUNCL5189" select="tokenize('41 42 60 62 63 64 65 66 67 68 70 71 88 95 100 102 103 104 105', '\s')" />
  <xsl:variable name="clUNCL5305" select="tokenize('AE E S Z G O K L M', '\s')" />
  <xsl:variable name="clUNCL7143" select="tokenize('AA AB AC AD AE AF AG AH AI AJ AK AL AM AN AO AP AQ AR AS AT AU AV AW AX AY AZ BA BB BC BD BE BF BG BH BI BJ BK BL BM BN BO BP BQ BR BS BT BU BV BW BX BY BZ CC CG CL CR CV DR DW EC EF EN FS GB GN GS HS IB IN IS IT IZ MA MF MN MP NB ON PD PL PO PV QS RC RN RU RY SA SG SK SN SRS SRT SRU SRV SRW SRX SRY SRZ SS SSA SSB SSC SSD SSE SSF SSG SSH SSI SSJ SSK SSL SSM SSN SSO SSP SSQ SSR SSS SST SSU SSV SSW SSX SSY SSZ ST STA STB STC STD STE STF STG STH STI STJ STK STL STM STN STO STP STQ STR STS STT STU STV STW STX STY STZ SUA SUB SUC SUD SUE SUF SUG SUH SUI SUJ SUK SUL SUM TG TSN TSO TSP TSP TSQ TSR TSS TST UA UP VN VP VS VX ZZZ', '\s')" />
  <xsl:variable name="clUNECERec20" select="tokenize('10 11 13 14 15 20 21 22 23 24 25 27 28 33 34 35 37 38 40 41 56 57 58 59 60 61 74 77 80 81 85 87 89 91 1I 2A 2B 2C 2G 2H 2I 2J 2K 2L 2M 2N 2P 2Q 2R 2U 2X 2Y 2Z 3B 3C 4C 4G 4H 4K 4L 4M 4N 4O 4P 4Q 4R 4T 4U 4W 4X 5A 5B 5E 5J A10 A11 A12 A13 A14 A15 A16 A17 A18 A19 A2 A20 A21 A22 A23 A24 A26 A27 A28 A29 A3 A30 A31 A32 A33 A34 A35 A36 A37 A38 A39 A4 A40 A41 A42 A43 A44 A45 A47 A48 A49 A5 A53 A54 A55 A56 A59 A6 A68 A69 A7 A70 A71 A73 A74 A75 A76 A8 A84 A85 A86 A87 A88 A89 A9 A90 A91 A93 A94 A95 A96 A97 A98 A99 AA AB ACR ACT AD AE AH AI AK AL AMH AMP ANN APZ AQ AS ASM ASU ATM AWG AY AZ B1 B10 B11 B12 B13 B14 B15 B16 B17 B18 B19 B20 B21 B22 B23 B24 B25 B26 B27 B28 B29 B3 B30 B31 B32 B33 B34 B35 B4 B41 B42 B43 B44 B45 B46 B47 B48 B49 B50 B52 B53 B54 B55 B56 B57 B58 B59 B60 B61 B62 B63 B64 B66 B67 B68 B69 B7 B70 B71 B72 B73 B74 B75 B76 B77 B78 B79 B8 B80 B81 B82 B83 B84 B85 B86 B87 B88 B89 B90 B91 B92 B93 B94 B95 B96 B97 B98 B99 BAR BB BFT BHP BIL BLD BLL BP BPM BQL BTU BUA BUI C0 C10 C11 C12 C13 C14 C15 C16 C17 C18 C19 C20 C21 C22 C23 C24 C25 C26 C27 C28 C29 C3 C30 C31 C32 C33 C34 C35 C36 C37 C38 C39 C40 C41 C42 C43 C44 C45 C46 C47 C48 C49 C50 C51 C52 C53 C54 C55 C56 C57 C58 C59 C60 C61 C62 C63 C64 C65 C66 C67 C68 C69 C7 C70 C71 C72 C73 C74 C75 C76 C78 C79 C8 C80 C81 C82 C83 C84 C85 C86 C87 C88 C89 C9 C90 C91 C92 C93 C94 C95 C96 C97 C99 CCT CDL CEL CEN CG CGM CKG CLF CLT CMK CMQ CMT CNP CNT COU CTG CTM CTN CUR CWA CWI D03 D04 D1 D10 D11 D12 D13 D15 D16 D17 D18 D19 D2 D20 D21 D22 D23 D24 D25 D26 D27 D29 D30 D31 D32 D33 D34 D36 D41 D42 D43 D44 D45 D46 D47 D48 D49 D5 D50 D51 D52 D53 D54 D55 D56 D57 D58 D59 D6 D60 D61 D62 D63 D65 D68 D69 D73 D74 D77 D78 D80 D81 D82 D83 D85 D86 D87 D88 D89 D91 D93 D94 D95 DAA DAD DAY DB DD DEC DG DJ DLT DMA DMK DMO DMQ DMT DN DPC DPR DPT DRA DRI DRL DT DTN DWT DZN DZP E01 E07 E08 E09 E10 E12 E14 E15 E16 E17 E18 E19 E20 E21 E22 E23 E25 E27 E28 E30 E31 E32 E33 E34 E35 E36 E37 E38 E39 E4 E40 E41 E42 E43 E44 E45 E46 E47 E48 E49 E50 E51 E52 E53 E54 E55 E56 E57 E58 E59 E60 E61 E62 E63 E64 E65 E66 E67 E68 E69 E70 E71 E72 E73 E74 E75 E76 E77 E78 E79 E80 E81 E82 E83 E84 E85 E86 E87 E88 E89 E90 E91 E92 E93 E94 E95 E96 E97 E98 E99 EA EB EQ F01 F02 F03 F04 F05 F06 F07 F08 F10 F11 F12 F13 F14 F15 F16 F17 F18 F19 F20 F21 F22 F23 F24 F25 F26 F27 F28 F29 F30 F31 F32 F33 F34 F35 F36 F37 F38 F39 F40 F41 F42 F43 F44 F45 F46 F47 F48 F49 F50 F51 F52 F53 F54 F55 F56 F57 F58 F59 F60 F61 F62 F63 F64 F65 F66 F67 F68 F69 F70 F71 F72 F73 F74 F75 F76 F77 F78 F79 F80 F81 F82 F83 F84 F85 F86 F87 F88 F89 F90 F91 F92 F93 F94 F95 F96 F97 F98 F99 FAH FAR FBM FC FF FH FIT FL FOT FP FR FS FTK FTQ G01 G04 G05 G06 G08 G09 G10 G11 G12 G13 G14 G15 G16 G17 G18 G19 G2 G20 G21 G23 G24 G25 G26 G27 G28 G29 G3 G30 G31 G32 G33 G34 G35 G36 G37 G38 G39 G40 G41 G42 G43 G44 G45 G46 G47 G48 G49 G50 G51 G52 G53 G54 G55 G56 G57 G58 G59 G60 G61 G62 G63 G64 G65 G66 G67 G68 G69 G70 G71 G72 G73 G74 G75 G76 G77 G78 G79 G80 G81 G82 G83 G84 G85 G86 G87 G88 G89 G90 G91 G92 G93 G94 G95 G96 G97 G98 G99 GB GBQ GDW GE GF GFI GGR GIA GIC GII GIP GJ GL GLD GLI GLL GM GO GP GQ GRM GRN GRO GV GWH H03 H04 H05 H06 H07 H08 H09 H10 H11 H12 H13 H14 H15 H16 H18 H19 H20 H21 H22 H23 H24 H25 H26 H27 H28 H29 H30 H31 H32 H33 H34 H35 H36 H37 H38 H39 H40 H41 H42 H43 H44 H45 H46 H47 H48 H49 H50 H51 H52 H53 H54 H55 H56 H57 H58 H59 H60 H61 H62 H63 H64 H65 H66 H67 H68 H69 H70 H71 H72 H73 H74 H75 H76 H77 H79 H80 H81 H82 H83 H84 H85 H87 H88 H89 H90 H91 H92 H93 H94 H95 H96 H98 H99 HA HBA HBX HC HDW HEA HGM HH HIU HKM HLT HM HMQ HMT HPA HTZ HUR IA IE INH INK INQ ISD IU IV J10 J12 J13 J14 J15 J16 J17 J18 J19 J2 J20 J21 J22 J23 J24 J25 J26 J27 J28 J29 J30 J31 J32 J33 J34 J35 J36 J38 J39 J40 J41 J42 J43 J44 J45 J46 J47 J48 J49 J50 J51 J52 J53 J54 J55 J56 J57 J58 J59 J60 J61 J62 J63 J64 J65 J66 J67 J68 J69 J70 J71 J72 J73 J74 J75 J76 J78 J79 J81 J82 J83 J84 J85 J87 J90 J91 J92 J93 J95 J96 J97 J98 J99 JE JK JM JNT JOU JPS JWL K1 K10 K11 K12 K13 K14 K15 K16 K17 K18 K19 K2 K20 K21 K22 K23 K26 K27 K28 K3 K30 K31 K32 K33 K34 K35 K36 K37 K38 K39 K40 K41 K42 K43 K45 K46 K47 K48 K49 K50 K51 K52 K53 K54 K55 K58 K59 K6 K60 K61 K62 K63 K64 K65 K66 K67 K68 K69 K70 K71 K73 K74 K75 K76 K77 K78 K79 K80 K81 K82 K83 K84 K85 K86 K87 K88 K89 K90 K91 K92 K93 K94 K95 K96 K97 K98 K99 KA KAT KB KBA KCC KDW KEL KGM KGS KHY KHZ KI KIC KIP KJ KJO KL KLK KLX KMA KMH KMK KMQ KMT KNI KNM KNS KNT KO KPA KPH KPO KPP KR KSD KSH KT KTN KUR KVA KVR KVT KW KWH KWO KWT KX L10 L11 L12 L13 L14 L15 L16 L17 L18 L19 L2 L20 L21 L23 L24 L25 L26 L27 L28 L29 L30 L31 L32 L33 L34 L35 L36 L37 L38 L39 L40 L41 L42 L43 L44 L45 L46 L47 L48 L49 L50 L51 L52 L53 L54 L55 L56 L57 L58 L59 L60 L63 L64 L65 L66 L67 L68 L69 L70 L71 L72 L73 L74 L75 L76 L77 L78 L79 L80 L81 L82 L83 L84 L85 L86 L87 L88 L89 L90 L91 L92 L93 L94 L95 L96 L98 L99 LA LAC LBR LBT LD LEF LF LH LK LM LN LO LP LPA LR LS LTN LTR LUB LUM LUX LY M1 M10 M11 M12 M13 M14 M15 M16 M17 M18 M19 M20 M21 M22 M23 M24 M25 M26 M27 M29 M30 M31 M32 M33 M34 M35 M36 M37 M38 M39 M4 M40 M41 M42 M43 M44 M45 M46 M47 M48 M49 M5 M50 M51 M52 M53 M55 M56 M57 M58 M59 M60 M61 M62 M63 M64 M65 M66 M67 M68 M69 M7 M70 M71 M72 M73 M74 M75 M76 M77 M78 M79 M80 M81 M82 M83 M84 M85 M86 M87 M88 M89 M9 M90 M91 M92 M93 M94 M95 M96 M97 M98 M99 MAH MAL MAM MAR MAW MBE MBF MBR MC MCU MD MGM MHZ MIK MIL MIN MIO MIU MLD MLT MMK MMQ MMT MND MON MPA MQH MQS MSK MTK MTQ MTR MTS MVA MWH N1 N10 N11 N12 N13 N14 N15 N16 N17 N18 N19 N20 N21 N22 N23 N24 N25 N26 N27 N28 N29 N3 N30 N31 N32 N33 N34 N35 N36 N37 N38 N39 N40 N41 N42 N43 N44 N45 N46 N47 N48 N49 N50 N51 N52 N53 N54 N55 N56 N57 N58 N59 N60 N61 N62 N63 N64 N65 N66 N67 N68 N69 N70 N71 N72 N73 N74 N75 N76 N77 N78 N79 N80 N81 N82 N83 N84 N85 N86 N87 N88 N89 N90 N91 N92 N93 N94 N95 N96 N97 N98 N99 NA NAR NCL NEW NF NIL NIU NL NM3 NMI NMP NPT NT NU NX OA ODE OHM ON ONZ OPM OT OZA OZI P1 P10 P11 P12 P13 P14 P15 P16 P17 P18 P19 P2 P20 P21 P22 P23 P24 P25 P26 P27 P28 P29 P30 P31 P32 P33 P34 P35 P36 P37 P38 P39 P40 P41 P42 P43 P44 P45 P46 P47 P48 P49 P5 P50 P51 P52 P53 P54 P55 P56 P57 P58 P59 P60 P61 P62 P63 P64 P65 P66 P67 P68 P69 P70 P71 P72 P73 P74 P75 P76 P77 P78 P79 P80 P81 P82 P83 P84 P85 P86 P87 P88 P89 P90 P91 P92 P93 P94 P95 P96 P97 P98 P99 PAL PD PFL PGL PI PLA PO PQ PR PS PTD PTI PTL PTN Q10 Q11 Q12 Q13 Q14 Q15 Q16 Q17 Q18 Q19 Q20 Q21 Q22 Q23 Q24 Q25 Q26 Q27 Q28 Q29 Q30 Q31 Q32 Q33 Q34 Q35 Q36 Q37 Q38 Q39 Q40 Q3 QA QAN QB QR QTD QTI QTL QTR R1 R9 RH RM ROM RP RPM RPS RT S3 S4 SAN SCO SCR SEC SET SG SIE SM3 SMI SQ SQR SR STC STI STK STL STN STW SW SX SYR T0 T3 TAH TAN TI TIC TIP TKM TMS TNE TP TPI TPR TQD TRL TST TTS U1 U2 UB UC VA VLT VP W2 WA WB WCD WE WEB WEE WG WHR WM WSD WTT X1 YDK YDQ YRD Z11 ZP ZZ X1A X1B X1D X1F X1G X1W X2C X3A X3H X43 X44 X4A X4B X4C X4D X4F X4G X4H X5H X5L X5M X6H X6P X7A X7B X8A X8B X8C XAA XAB XAC XAD XAE XAF XAG XAH XAI XAJ XAL XAM XAP XAT XAV XB4 XBA XBB XBC XBD XBE XBF XBG XBH XBI XBJ XBK XBL XBM XBN XBO XBP XBQ XBR XBS XBT XBU XBV XBW XBX XBY XBZ XCA XCB XCC XCD XCE XCF XCG XCH XCI XCJ XCK XCL XCM XCN XCO XCP XCQ XCR XCS XCT XCU XCV XCW XCX XCY XCZ XDA XDB XDC XDG XDH XDI XDJ XDK XDL XDM XDN XDP XDR XDS XDT XDU XDV XDW XDX XDY XEC XED XEE XEF XEG XEH XEI XEN XFB XFC XFD XFE XFI XFL XFO XFP XFR XFT XFW XFX XGB XGI XGL XGR XGU XGY XGZ XHA XHB XHC XHG XHN XHR XIA XIB XIC XID XIE XIF XIG XIH XIK XIL XIN XIZ XJB XJC XJG XJR XJT XJY XKG XKI XLE XLG XLT XLU XLV XLZ XMA XMB XMC XME XMR XMS XMT XMW XMX XNA XNE XNF XNG XNS XNT XNU XNV XOA XOB XOC XOD XOE XOF XOK XOT XOU XP2 XPA XPB XPC XPD XPE XPF XPG XPH XPI XPJ XPK XPL XPN XPO XPP XPR XPT XPU XPV XPX XPY XPZ XQA XQB XQC XQD XQF XQG XQH XQJ XQK XQL XQM XQN XQP XQQ XQR XQS XRD XRG XRJ XRK XRL XRO XRT XRZ XSA XSB XSC XSD XSE XSH XSI XSK XSL XSM XSO XSP XSS XST XSU XSV XSW XSY XSZ XT1 XTB XTC XTD XTE XTG XTI XTK XTL XTN XTO XTR XTS XTT XTU XTV XTW XTY XTZ XUC XUN XVA XVG XVI XVK XVL XVO XVP XVQ XVN XVR XVS XVY XWA XWB XWC XWD XWF XWG XWH XWJ XWK XWL XWM XWN XWP XWQ XWR XWS XWT XWU XWV XWW XWX XWY XWZ XXA XXB XXC XXD XXF XXG XXH XXJ XXK XYA XYB XYC XYD XYF XYG XYH XYJ XYK XYL XYM XYN XYP XYQ XYR XYS XYT XYV XYW XYX XYY XYZ XZA XZB XZC XZD XZF XZG XZH XZJ XZK XZL XZM XZN XZP XZQ XZR XZS XZT XZU XZV XZW XZX XZY', '\s')" />
  <xsl:variable name="clISO3166" select="tokenize('AD AE AF AG AI AL AM AO AQ AR AS AT AU AW AX AZ BA BB BD BE BF BG BH BI BJ BL BM BN BO BQ BR BS BT BV BW BY BZ CA CC CD CF CG CH CI CK CL CM CN CO CR CU CV CW CX CY CZ DE DJ DK DM DO DZ EC EE EG EH ER ES ET FI FJ FK FM FO FR GA GB GD GE GF GG GH GI GL GM GN GP GQ GR GS GT GU GW GY HK HM HN HR HT HU ID IE IL IM IN IO IQ IR IS IT JE JM JO JP KE KG KH KI KM KN KP KR KW KY KZ LA LB LC LI LK LR LS LT LU LV LY MA MC MD ME MF MG MH MK ML MM MN MO MP MQ MR MS MT MU MV MW MX MY MZ NA NC NE NF NG NI NL NO NP NR NU NZ OM PA PE PF PG PH PK PL PM PN PR PS PT PW PY QA RE RO RS RU RW SA SB SC SD SE SG SH SI SJ SK SL SM SN SO SR SS ST SV SX SY SZ TC TD TF TG TH TJ TK TL TM TN TO TR TT TV TW TZ UA UG UM US UY UZ VA VC VE VG VI VN VU WF WS YE YT ZA ZM ZW', '\s')" />
  <xsl:variable name="clICD" select="tokenize('0002 0003 0004 0005 0006 0007 0008 0009 0010 0011 0012 0013 0014 0015 0016 0017 0018 0019 0020 0021 0022 0023 0024 0025 0026 0027 0028 0029 0030 0031 0032 0033 0034 0035 0036 0037 0038 0039 0040 0041 0042 0043 0044 0045 0046 0047 0048 0049 0050 0051 0052 0053 0054 0055 0056 0057 0058 0059 0060 0061 0062 0063 0064 0065 0066 0067 0068 0069 0070 0071 0072 0073 0074 0075 0076 0077 0078 0079 0080 0081 0082 0083 0084 0085 0086 0087 0088 0089 0090 0091 0093 0094 0095 0096 0097 0098 0099 0100 0101 0102 0104 0105 0106 0107 0108 0109 0110 0111 0112 0113 0114 0115 0116 0117 0118 0119 0120 0121 0122 0123 0124 0125 0126 0127 0128 0129 0130 0131 0132 0133 0134 0135 0136 0137 0138 0139 0140 0141 0142 0143 0144 0145 0146 0147 0148 0149 0150 0151 0152 0153 0154 0155 0156 0157 0158 0159 0160 0161 0162 0163 0164 0165 0166 0167 0168 0169 0170 0171 0172 0173 0174 0175 0176 0177 0178 0179 0180 0183 0184 0185 0186 0187 0188 0189 0190 0191 0192 0193 0195 0196 0199 0200 0201 0202', '\s')" />
  <xsl:variable name="clMimeCode" select="tokenize('application/pdf image/png image/jpeg image/tiff application/acad application/dwg drawing/dwg application/vnd.openxmlformats-officedocument.spreadsheetml.sheet application/vnd.oasis.opendocument.spreadsheet', '\s')" />
  <xsl:variable name="clUNCL7161" select="tokenize('AA AAA AAC AAD AAE AAF AAH AAI AAS AAT AAV AAY AAZ ABA ABB ABC ABD ABF ABK ABL ABN ABR ABS ABT ABU ACF ACG ACH ACI ACJ ACK ACL ACM ACS ADC ADE ADJ ADK ADL ADM ADN ADO ADP ADQ ADR ADT ADW ADY ADZ AEA AEB AEC AED AEF AEH AEI AEJ AEK AEL AEM AEN AEO AEP AES AET AEU AEV AEW AEX AEY AEZ AJ AU CA CAB CAD CAE CAF CAI CAJ CAK CAL CAM CAN CAO CAP CAQ CAR CAS CAT CAU CAV CAW CD CG CS CT DAB DAD DL EG EP ER FAA FAB FAC FC FH FI GAA HAA HD HH IAA IAB ID IF IR IS KO L1 LA LAA LAB LF MAE MI ML NAA OA PA PAA PC PL RAB RAC RAD RAF RE RF RH RV SA SAA SAD SAE SAI SG SH SM SU TAB TAC TT TV V1 V2 WH XAA YY ZZZ', '\s')" />

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse" mode="M12" priority="1267">
    <svrl:fired-rule context="/ubl:OrderResponse" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:CustomizationID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:CustomizationID">
          <xsl:attribute name="id">PEPPOL-T110-B00101</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
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
          <xsl:attribute name="id">PEPPOL-T110-B00102</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
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
          <xsl:attribute name="id">PEPPOL-T110-B00103</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
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
          <xsl:attribute name="id">PEPPOL-T110-B00104</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:IssueDate' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:OrderReference" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:OrderReference">
          <xsl:attribute name="id">PEPPOL-T110-B00105</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:OrderReference' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:SellerSupplierParty" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:SellerSupplierParty">
          <xsl:attribute name="id">PEPPOL-T110-B00106</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:SellerSupplierParty' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:BuyerCustomerParty" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:BuyerCustomerParty">
          <xsl:attribute name="id">PEPPOL-T110-B00107</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:BuyerCustomerParty' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:OrderLine" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:OrderLine">
          <xsl:attribute name="id">PEPPOL-T110-B00108</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:OrderLine' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(@*:schemaLocation)" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(@*:schemaLocation)">
          <xsl:attribute name="id">PEPPOL-T110-B00109</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST not contain schema location.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cbc:CustomizationID" mode="M12" priority="1266">
    <svrl:fired-rule context="/ubl:OrderResponse/cbc:CustomizationID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="normalize-space(text()) = 'urn:fdc:peppol.eu:poacc:trns:order_agreement:3'" />
      <xsl:otherwise>
        <svrl:failed-assert test="normalize-space(text()) = 'urn:fdc:peppol.eu:poacc:trns:order_agreement:3'">
          <xsl:attribute name="id">PEPPOL-T110-B00201</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:CustomizationID' MUST contain value 'urn:fdc:peppol.eu:poacc:trns:order_agreement:3'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cbc:ProfileID" mode="M12" priority="1265">
    <svrl:fired-rule context="/ubl:OrderResponse/cbc:ProfileID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="normalize-space(text()) = 'urn:fdc:peppol.eu:poacc:bis:order_agreement:3'" />
      <xsl:otherwise>
        <svrl:failed-assert test="normalize-space(text()) = 'urn:fdc:peppol.eu:poacc:bis:order_agreement:3'">
          <xsl:attribute name="id">PEPPOL-T110-B00301</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ProfileID' MUST contain value 'urn:fdc:peppol.eu:poacc:bis:order_agreement:3'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cbc:ID" mode="M12" priority="1264">
    <svrl:fired-rule context="/ubl:OrderResponse/cbc:ID" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cbc:SalesOrderID" mode="M12" priority="1263">
    <svrl:fired-rule context="/ubl:OrderResponse/cbc:SalesOrderID" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cbc:IssueDate" mode="M12" priority="1262">
    <svrl:fired-rule context="/ubl:OrderResponse/cbc:IssueDate" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cbc:IssueTime" mode="M12" priority="1261">
    <svrl:fired-rule context="/ubl:OrderResponse/cbc:IssueTime" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cbc:Note" mode="M12" priority="1260">
    <svrl:fired-rule context="/ubl:OrderResponse/cbc:Note" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cbc:DocumentCurrencyCode" mode="M12" priority="1259">
    <svrl:fired-rule context="/ubl:OrderResponse/cbc:DocumentCurrencyCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(some $code in $clISO4217 satisfies $code = normalize-space(text()))" />
      <xsl:otherwise>
        <svrl:failed-assert test="(some $code in $clISO4217 satisfies $code = normalize-space(text()))">
          <xsl:attribute name="id">PEPPOL-T110-B00901</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Value MUST be part of code list 'Currency codes (ISO 4217)'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cbc:CustomerReference" mode="M12" priority="1258">
    <svrl:fired-rule context="/ubl:OrderResponse/cbc:CustomerReference" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderReference" mode="M12" priority="1257">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderReference" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">PEPPOL-T110-B01101</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderReference/cbc:ID" mode="M12" priority="1256">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderReference/cbc:ID" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderReference/*" mode="M12" priority="1255">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderReference/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B01102</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OriginatorDocumentReference" mode="M12" priority="1254">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OriginatorDocumentReference" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">PEPPOL-T110-B01301</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OriginatorDocumentReference/cbc:ID" mode="M12" priority="1253">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OriginatorDocumentReference/cbc:ID" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OriginatorDocumentReference/*" mode="M12" priority="1252">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OriginatorDocumentReference/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B01302</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:AdditionalDocumentReference" mode="M12" priority="1251">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:AdditionalDocumentReference" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">PEPPOL-T110-B01501</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:AdditionalDocumentReference/cbc:ID" mode="M12" priority="1250">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:AdditionalDocumentReference/cbc:ID" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:AdditionalDocumentReference/cbc:DocumentType" mode="M12" priority="1249">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:AdditionalDocumentReference/cbc:DocumentType" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:AdditionalDocumentReference/cac:Attachment" mode="M12" priority="1248">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:AdditionalDocumentReference/cac:Attachment" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:AdditionalDocumentReference/cac:Attachment/cbc:EmbeddedDocumentBinaryObject" mode="M12" priority="1247">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:AdditionalDocumentReference/cac:Attachment/cbc:EmbeddedDocumentBinaryObject" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@mimeCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="@mimeCode">
          <xsl:attribute name="id">PEPPOL-T110-B01901</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'mimeCode' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(@mimeCode) or (some $code in $clMimeCode satisfies $code = @mimeCode)" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(@mimeCode) or (some $code in $clMimeCode satisfies $code = @mimeCode)">
          <xsl:attribute name="id">PEPPOL-T110-B01902</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Value MUST be part of code list 'Mime code (IANA Subset)'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@filename" />
      <xsl:otherwise>
        <svrl:failed-assert test="@filename">
          <xsl:attribute name="id">PEPPOL-T110-B01903</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'filename' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference" mode="M12" priority="1246">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:URI" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:URI">
          <xsl:attribute name="id">PEPPOL-T110-B02201</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:URI' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI" mode="M12" priority="1245">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/*" mode="M12" priority="1244">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B02202</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:AdditionalDocumentReference/cac:Attachment/*" mode="M12" priority="1243">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:AdditionalDocumentReference/cac:Attachment/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B01801</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:AdditionalDocumentReference/*" mode="M12" priority="1242">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:AdditionalDocumentReference/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B01502</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:Contract" mode="M12" priority="1241">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:Contract" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">PEPPOL-T110-B02401</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:Contract/cbc:ID" mode="M12" priority="1240">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:Contract/cbc:ID" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:Contract/*" mode="M12" priority="1239">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:Contract/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B02402</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:SellerSupplierParty" mode="M12" priority="1238">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:SellerSupplierParty" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:Party" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:Party">
          <xsl:attribute name="id">PEPPOL-T110-B02601</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:Party' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party" mode="M12" priority="1237">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:EndpointID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:EndpointID">
          <xsl:attribute name="id">PEPPOL-T110-B02701</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:EndpointID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:PartyLegalEntity" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:PartyLegalEntity">
          <xsl:attribute name="id">PEPPOL-T110-B02702</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:PartyLegalEntity' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:EndpointID" mode="M12" priority="1236">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cbc:EndpointID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@schemeID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@schemeID">
          <xsl:attribute name="id">PEPPOL-T110-B02801</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'schemeID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(@schemeID) or (some $code in $cleas satisfies $code = @schemeID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(@schemeID) or (some $code in $cleas satisfies $code = @schemeID)">
          <xsl:attribute name="id">PEPPOL-T110-B02802</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Value MUST be part of code list 'Electronic Address Scheme (EAS)'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification" mode="M12" priority="1235">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">PEPPOL-T110-B03001</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID" mode="M12" priority="1234">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(@schemeID) or (some $code in $clICD satisfies $code = @schemeID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(@schemeID) or (some $code in $clICD satisfies $code = @schemeID)">
          <xsl:attribute name="id">PEPPOL-T110-B03101</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Value MUST be part of code list 'ISO 6523 ICD list'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress" mode="M12" priority="1233">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:Country" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:Country">
          <xsl:attribute name="id">PEPPOL-T110-B03301</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:Country' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:StreetName" mode="M12" priority="1232">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:StreetName" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName" mode="M12" priority="1231">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:CityName" mode="M12" priority="1230">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:CityName" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:PostalZone" mode="M12" priority="1229">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:PostalZone" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity" mode="M12" priority="1228">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:AddressLine" mode="M12" priority="1227">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:AddressLine" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:AddressLine/cbc:Line" mode="M12" priority="1226">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:AddressLine/cbc:Line" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country" mode="M12" priority="1225">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:IdentificationCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:IdentificationCode">
          <xsl:attribute name="id">PEPPOL-T110-B04101</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:IdentificationCode' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode" mode="M12" priority="1224">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(some $code in $clISO3166 satisfies $code = normalize-space(text()))" />
      <xsl:otherwise>
        <svrl:failed-assert test="(some $code in $clISO3166 satisfies $code = normalize-space(text()))">
          <xsl:attribute name="id">PEPPOL-T110-B04201</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Value MUST be part of code list 'Country codes (ISO 3166-1:Alpha2)'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country/*" mode="M12" priority="1223">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B04102</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/*" mode="M12" priority="1222">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PostalAddress/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B03302</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity" mode="M12" priority="1221">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:RegistrationName" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:RegistrationName">
          <xsl:attribute name="id">PEPPOL-T110-B04301</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:RegistrationName' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName" mode="M12" priority="1220">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/*" mode="M12" priority="1219">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B04302</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact" mode="M12" priority="1218">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Name" mode="M12" priority="1217">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Name" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telephone" mode="M12" priority="1216">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Telephone" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail" mode="M12" priority="1215">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/*" mode="M12" priority="1214">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/cac:Contact/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B04501</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/*" mode="M12" priority="1213">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:SellerSupplierParty/cac:Party/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B02703</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:SellerSupplierParty/*" mode="M12" priority="1212">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:SellerSupplierParty/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B02602</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:BuyerCustomerParty" mode="M12" priority="1211">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:BuyerCustomerParty" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:Party" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:Party">
          <xsl:attribute name="id">PEPPOL-T110-B04901</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:Party' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:Party" mode="M12" priority="1210">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:Party" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:EndpointID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:EndpointID">
          <xsl:attribute name="id">PEPPOL-T110-B05001</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:EndpointID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:PartyLegalEntity" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:PartyLegalEntity">
          <xsl:attribute name="id">PEPPOL-T110-B05002</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:PartyLegalEntity' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:EndpointID" mode="M12" priority="1209">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:Party/cbc:EndpointID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@schemeID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@schemeID">
          <xsl:attribute name="id">PEPPOL-T110-B05101</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'schemeID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(@schemeID) or (some $code in $cleas satisfies $code = @schemeID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(@schemeID) or (some $code in $cleas satisfies $code = @schemeID)">
          <xsl:attribute name="id">PEPPOL-T110-B05102</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Value MUST be part of code list 'Electronic Address Scheme (EAS)'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification" mode="M12" priority="1208">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">PEPPOL-T110-B05301</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID" mode="M12" priority="1207">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(@schemeID) or (some $code in $clICD satisfies $code = @schemeID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(@schemeID) or (some $code in $clICD satisfies $code = @schemeID)">
          <xsl:attribute name="id">PEPPOL-T110-B05401</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Value MUST be part of code list 'ISO 6523 ICD list'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress" mode="M12" priority="1206">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:Country" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:Country">
          <xsl:attribute name="id">PEPPOL-T110-B05601</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:Country' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName" mode="M12" priority="1205">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName" mode="M12" priority="1204">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:CityName" mode="M12" priority="1203">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:CityName" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:PostalZone" mode="M12" priority="1202">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:PostalZone" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity" mode="M12" priority="1201">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cac:AddressLine" mode="M12" priority="1200">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cac:AddressLine" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cac:AddressLine/cbc:Line" mode="M12" priority="1199">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cac:AddressLine/cbc:Line" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cac:Country" mode="M12" priority="1198">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cac:Country" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:IdentificationCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:IdentificationCode">
          <xsl:attribute name="id">PEPPOL-T110-B06401</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:IdentificationCode' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode" mode="M12" priority="1197">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(some $code in $clISO3166 satisfies $code = normalize-space(text()))" />
      <xsl:otherwise>
        <svrl:failed-assert test="(some $code in $clISO3166 satisfies $code = normalize-space(text()))">
          <xsl:attribute name="id">PEPPOL-T110-B06501</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Value MUST be part of code list 'Country codes (ISO 3166-1:Alpha2)'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cac:Country/*" mode="M12" priority="1196">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cac:Country/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B06402</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/*" mode="M12" priority="1195">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B05602</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity" mode="M12" priority="1194">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:RegistrationName" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:RegistrationName">
          <xsl:attribute name="id">PEPPOL-T110-B06601</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:RegistrationName' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName" mode="M12" priority="1193">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/*" mode="M12" priority="1192">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B06602</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:Party/*" mode="M12" priority="1191">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:Party/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B05003</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:DeliveryContact" mode="M12" priority="1190">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:DeliveryContact" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:DeliveryContact/cbc:Name" mode="M12" priority="1189">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:DeliveryContact/cbc:Name" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:DeliveryContact/cbc:Telephone" mode="M12" priority="1188">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:DeliveryContact/cbc:Telephone" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:DeliveryContact/cbc:ElectronicMail" mode="M12" priority="1187">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:DeliveryContact/cbc:ElectronicMail" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:DeliveryContact/*" mode="M12" priority="1186">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:BuyerCustomerParty/cac:DeliveryContact/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B06801</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:BuyerCustomerParty/*" mode="M12" priority="1185">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:BuyerCustomerParty/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B04902</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OriginatorCustomerParty" mode="M12" priority="1184">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OriginatorCustomerParty" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OriginatorCustomerParty/cac:Party" mode="M12" priority="1183">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OriginatorCustomerParty/cac:Party" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OriginatorCustomerParty/cac:Party/cac:PartyIdentification" mode="M12" priority="1182">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OriginatorCustomerParty/cac:Party/cac:PartyIdentification" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">PEPPOL-T110-B07401</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OriginatorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID" mode="M12" priority="1181">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OriginatorCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(@schemeID) or (some $code in $clICD satisfies $code = @schemeID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(@schemeID) or (some $code in $clICD satisfies $code = @schemeID)">
          <xsl:attribute name="id">PEPPOL-T110-B07501</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Value MUST be part of code list 'ISO 6523 ICD list'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OriginatorCustomerParty/cac:Party/cac:PartyName" mode="M12" priority="1180">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OriginatorCustomerParty/cac:Party/cac:PartyName" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:Name" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:Name">
          <xsl:attribute name="id">PEPPOL-T110-B07701</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:Name' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OriginatorCustomerParty/cac:Party/cac:PartyName/cbc:Name" mode="M12" priority="1179">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OriginatorCustomerParty/cac:Party/cac:PartyName/cbc:Name" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OriginatorCustomerParty/cac:Party/*" mode="M12" priority="1178">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OriginatorCustomerParty/cac:Party/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B07301</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OriginatorCustomerParty/*" mode="M12" priority="1177">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OriginatorCustomerParty/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B07201</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:AccountingCustomerParty" mode="M12" priority="1176">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:AccountingCustomerParty" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:AccountingCustomerParty/cac:Party" mode="M12" priority="1175">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:AccountingCustomerParty/cac:Party" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification" mode="M12" priority="1174">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">PEPPOL-T110-B08101</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID" mode="M12" priority="1173">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(@schemeID) or (some $code in $clICD satisfies $code = @schemeID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(@schemeID) or (some $code in $clICD satisfies $code = @schemeID)">
          <xsl:attribute name="id">PEPPOL-T110-B08201</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Value MUST be part of code list 'ISO 6523 ICD list'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:AccountingCustomerParty/cac:Party/cac:PartyName" mode="M12" priority="1172">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:AccountingCustomerParty/cac:Party/cac:PartyName" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:Name" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:Name">
          <xsl:attribute name="id">PEPPOL-T110-B08401</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:Name' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:AccountingCustomerParty/cac:Party/cac:PartyName/cbc:Name" mode="M12" priority="1171">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:AccountingCustomerParty/cac:Party/cac:PartyName/cbc:Name" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:AccountingCustomerParty/cac:Party/*" mode="M12" priority="1170">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:AccountingCustomerParty/cac:Party/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B08001</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:AccountingCustomerParty/*" mode="M12" priority="1169">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:AccountingCustomerParty/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B07901</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:Delivery" mode="M12" priority="1168">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:Delivery" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:Delivery/cac:PromisedDeliveryPeriod" mode="M12" priority="1167">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:Delivery/cac:PromisedDeliveryPeriod" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:StartDate" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:StartDate">
          <xsl:attribute name="id">PEPPOL-T110-B08701</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:StartDate' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:StartDate" mode="M12" priority="1166">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:StartDate" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:StartTime" mode="M12" priority="1165">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:StartTime" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:EndDate" mode="M12" priority="1164">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:EndDate" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:EndTime" mode="M12" priority="1163">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:EndTime" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:Delivery/cac:PromisedDeliveryPeriod/*" mode="M12" priority="1162">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:Delivery/cac:PromisedDeliveryPeriod/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B08702</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:Delivery/cac:DeliveryParty" mode="M12" priority="1161">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:Delivery/cac:DeliveryParty" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:PartyIdentification" mode="M12" priority="1160">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:PartyIdentification" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">PEPPOL-T110-B09301</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:PartyIdentification/cbc:ID" mode="M12" priority="1159">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:PartyIdentification/cbc:ID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(@schemeID) or (some $code in $clICD satisfies $code = @schemeID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(@schemeID) or (some $code in $clICD satisfies $code = @schemeID)">
          <xsl:attribute name="id">PEPPOL-T110-B09401</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Value MUST be part of code list 'ISO 6523 ICD list'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:PartyName" mode="M12" priority="1158">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:PartyName" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:Name" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:Name">
          <xsl:attribute name="id">PEPPOL-T110-B09601</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:Name' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:PartyName/cbc:Name" mode="M12" priority="1157">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:PartyName/cbc:Name" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:PostalAddress" mode="M12" priority="1156">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:PostalAddress" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:PostalAddress/cbc:StreetName" mode="M12" priority="1155">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:PostalAddress/cbc:StreetName" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:PostalAddress/cbc:AdditionalStreetName" mode="M12" priority="1154">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:PostalAddress/cbc:AdditionalStreetName" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:PostalAddress/cbc:CityName" mode="M12" priority="1153">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:PostalAddress/cbc:CityName" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:PostalAddress/cbc:PostalZone" mode="M12" priority="1152">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:PostalAddress/cbc:PostalZone" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:PostalAddress/cbc:CountrySubentity" mode="M12" priority="1151">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:PostalAddress/cbc:CountrySubentity" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:PostalAddress/cac:AddressLine" mode="M12" priority="1150">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:PostalAddress/cac:AddressLine" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:PostalAddress/cac:AddressLine/cbc:Line" mode="M12" priority="1149">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:PostalAddress/cac:AddressLine/cbc:Line" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:PostalAddress/cac:Country" mode="M12" priority="1148">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:PostalAddress/cac:Country" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:IdentificationCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:IdentificationCode">
          <xsl:attribute name="id">PEPPOL-T110-B10601</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:IdentificationCode' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode" mode="M12" priority="1147">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:PostalAddress/cac:Country/cbc:IdentificationCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(some $code in $clISO3166 satisfies $code = normalize-space(text()))" />
      <xsl:otherwise>
        <svrl:failed-assert test="(some $code in $clISO3166 satisfies $code = normalize-space(text()))">
          <xsl:attribute name="id">PEPPOL-T110-B10701</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Value MUST be part of code list 'Country codes (ISO 3166-1:Alpha2)'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:PostalAddress/cac:Country/*" mode="M12" priority="1146">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:PostalAddress/cac:Country/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B10602</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:PostalAddress/*" mode="M12" priority="1145">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:Delivery/cac:DeliveryParty/cac:PostalAddress/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B09801</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:Delivery/cac:DeliveryParty/*" mode="M12" priority="1144">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:Delivery/cac:DeliveryParty/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B09201</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:Delivery/*" mode="M12" priority="1143">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:Delivery/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B08601</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:DeliveryTerms" mode="M12" priority="1142">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:DeliveryTerms" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:DeliveryTerms/cbc:ID" mode="M12" priority="1141">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:DeliveryTerms/cbc:ID" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:DeliveryTerms/cbc:SpecialTerms" mode="M12" priority="1140">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:DeliveryTerms/cbc:SpecialTerms" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:DeliveryTerms/cac:DeliveryLocation" mode="M12" priority="1139">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:DeliveryTerms/cac:DeliveryLocation" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">PEPPOL-T110-B11101</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:DeliveryTerms/cac:DeliveryLocation/cbc:ID" mode="M12" priority="1138">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:DeliveryTerms/cac:DeliveryLocation/cbc:ID" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:DeliveryTerms/cac:DeliveryLocation/cac:Address" mode="M12" priority="1137">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:DeliveryTerms/cac:DeliveryLocation/cac:Address" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:DeliveryTerms/cac:DeliveryLocation/cac:Address/cbc:StreetName" mode="M12" priority="1136">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:DeliveryTerms/cac:DeliveryLocation/cac:Address/cbc:StreetName" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:DeliveryTerms/cac:DeliveryLocation/cac:Address/cbc:AdditionalStreetName" mode="M12" priority="1135">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:DeliveryTerms/cac:DeliveryLocation/cac:Address/cbc:AdditionalStreetName" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:DeliveryTerms/cac:DeliveryLocation/cac:Address/cbc:CityName" mode="M12" priority="1134">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:DeliveryTerms/cac:DeliveryLocation/cac:Address/cbc:CityName" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:DeliveryTerms/cac:DeliveryLocation/cac:Address/cbc:PostalZone" mode="M12" priority="1133">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:DeliveryTerms/cac:DeliveryLocation/cac:Address/cbc:PostalZone" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:DeliveryTerms/cac:DeliveryLocation/cac:Address/cbc:CountrySubentity" mode="M12" priority="1132">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:DeliveryTerms/cac:DeliveryLocation/cac:Address/cbc:CountrySubentity" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:DeliveryTerms/cac:DeliveryLocation/cac:Address/cac:AddressLine" mode="M12" priority="1131">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:DeliveryTerms/cac:DeliveryLocation/cac:Address/cac:AddressLine" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:DeliveryTerms/cac:DeliveryLocation/cac:Address/cac:AddressLine/cbc:Line" mode="M12" priority="1130">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:DeliveryTerms/cac:DeliveryLocation/cac:Address/cac:AddressLine/cbc:Line" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:DeliveryTerms/cac:DeliveryLocation/cac:Address/cac:Country" mode="M12" priority="1129">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:DeliveryTerms/cac:DeliveryLocation/cac:Address/cac:Country" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:IdentificationCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:IdentificationCode">
          <xsl:attribute name="id">PEPPOL-T110-B12101</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:IdentificationCode' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:DeliveryTerms/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode" mode="M12" priority="1128">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:DeliveryTerms/cac:DeliveryLocation/cac:Address/cac:Country/cbc:IdentificationCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(some $code in $clISO3166 satisfies $code = normalize-space(text()))" />
      <xsl:otherwise>
        <svrl:failed-assert test="(some $code in $clISO3166 satisfies $code = normalize-space(text()))">
          <xsl:attribute name="id">PEPPOL-T110-B12201</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Value MUST be part of code list 'Country codes (ISO 3166-1:Alpha2)'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:DeliveryTerms/cac:DeliveryLocation/cac:Address/cac:Country/*" mode="M12" priority="1127">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:DeliveryTerms/cac:DeliveryLocation/cac:Address/cac:Country/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B12102</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:DeliveryTerms/cac:DeliveryLocation/cac:Address/*" mode="M12" priority="1126">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:DeliveryTerms/cac:DeliveryLocation/cac:Address/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B11301</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:DeliveryTerms/cac:DeliveryLocation/*" mode="M12" priority="1125">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:DeliveryTerms/cac:DeliveryLocation/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B11102</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:DeliveryTerms/*" mode="M12" priority="1124">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:DeliveryTerms/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B10801</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:AllowanceCharge" mode="M12" priority="1123">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:AllowanceCharge" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ChargeIndicator" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ChargeIndicator">
          <xsl:attribute name="id">PEPPOL-T110-B12301</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
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
          <xsl:attribute name="id">PEPPOL-T110-B12302</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
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
          <xsl:attribute name="id">PEPPOL-T110-B12303</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:TaxCategory' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:AllowanceCharge/cbc:ChargeIndicator" mode="M12" priority="1122">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:AllowanceCharge/cbc:ChargeIndicator" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(some $code in $clTrueFalse satisfies $code = normalize-space(text()))" />
      <xsl:otherwise>
        <svrl:failed-assert test="(some $code in $clTrueFalse satisfies $code = normalize-space(text()))">
          <xsl:attribute name="id">PEPPOL-T110-B12401</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Value MUST be part of code list 'Boolean indicator (openPEPPOL)'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode" mode="M12" priority="1121">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(some $code in $clUNCL5189 satisfies $code = normalize-space(text())) or (some $code in $clUNCL7161 satisfies $code = normalize-space(text()))" />
      <xsl:otherwise>
        <svrl:failed-assert test="(some $code in $clUNCL5189 satisfies $code = normalize-space(text())) or (some $code in $clUNCL7161 satisfies $code = normalize-space(text()))">
          <xsl:attribute name="id">PEPPOL-T110-B12501</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Value MUST be part of code list 'Allowance reason codes (UNCL5189 subset)' or 'Charge reason code (UNCL7161)'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:AllowanceCharge/cbc:AllowanceChargeReason" mode="M12" priority="1120">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:AllowanceCharge/cbc:AllowanceChargeReason" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:AllowanceCharge/cbc:MultiplierFactorNumeric" mode="M12" priority="1119">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:AllowanceCharge/cbc:MultiplierFactorNumeric" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:AllowanceCharge/cbc:Amount" mode="M12" priority="1118">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:AllowanceCharge/cbc:Amount" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@currencyID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@currencyID">
          <xsl:attribute name="id">PEPPOL-T110-B12801</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'currencyID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(@currencyID) or (some $code in $clISO4217 satisfies $code = @currencyID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(@currencyID) or (some $code in $clISO4217 satisfies $code = @currencyID)">
          <xsl:attribute name="id">PEPPOL-T110-B12802</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Value MUST be part of code list 'Currency codes (ISO 4217)'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:AllowanceCharge/cbc:BaseAmount" mode="M12" priority="1117">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:AllowanceCharge/cbc:BaseAmount" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@currencyID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@currencyID">
          <xsl:attribute name="id">PEPPOL-T110-B13001</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'currencyID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(@currencyID) or (some $code in $clISO4217 satisfies $code = @currencyID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(@currencyID) or (some $code in $clISO4217 satisfies $code = @currencyID)">
          <xsl:attribute name="id">PEPPOL-T110-B13002</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Value MUST be part of code list 'Currency codes (ISO 4217)'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:AllowanceCharge/cac:TaxCategory" mode="M12" priority="1116">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:AllowanceCharge/cac:TaxCategory" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">PEPPOL-T110-B13201</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
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
          <xsl:attribute name="id">PEPPOL-T110-B13202</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:TaxScheme' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:AllowanceCharge/cac:TaxCategory/cbc:ID" mode="M12" priority="1115">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:AllowanceCharge/cac:TaxCategory/cbc:ID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(some $code in $clUNCL5305 satisfies $code = normalize-space(text()))" />
      <xsl:otherwise>
        <svrl:failed-assert test="(some $code in $clUNCL5305 satisfies $code = normalize-space(text()))">
          <xsl:attribute name="id">PEPPOL-T110-B13301</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Value MUST be part of code list 'Duty or tax or fee category code (UNCL5305)'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:AllowanceCharge/cac:TaxCategory/cbc:Percent" mode="M12" priority="1114">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:AllowanceCharge/cac:TaxCategory/cbc:Percent" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme" mode="M12" priority="1113">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">PEPPOL-T110-B13501</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:ID" mode="M12" priority="1112">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:ID" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/*" mode="M12" priority="1111">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B13502</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:AllowanceCharge/cac:TaxCategory/*" mode="M12" priority="1110">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:AllowanceCharge/cac:TaxCategory/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B13203</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:AllowanceCharge/*" mode="M12" priority="1109">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:AllowanceCharge/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B12304</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:TaxTotal" mode="M12" priority="1108">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:TaxTotal" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:TaxAmount" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:TaxAmount">
          <xsl:attribute name="id">PEPPOL-T110-B13701</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:TaxAmount' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:TaxTotal/cbc:TaxAmount" mode="M12" priority="1107">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:TaxTotal/cbc:TaxAmount" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@currencyID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@currencyID">
          <xsl:attribute name="id">PEPPOL-T110-B13801</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'currencyID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(@currencyID) or (some $code in $clISO4217 satisfies $code = @currencyID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(@currencyID) or (some $code in $clISO4217 satisfies $code = @currencyID)">
          <xsl:attribute name="id">PEPPOL-T110-B13802</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Value MUST be part of code list 'Currency codes (ISO 4217)'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:TaxTotal/cac:TaxSubtotal" mode="M12" priority="1106">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:TaxTotal/cac:TaxSubtotal" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:TaxableAmount" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:TaxableAmount">
          <xsl:attribute name="id">PEPPOL-T110-B14001</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
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
          <xsl:attribute name="id">PEPPOL-T110-B14002</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
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
          <xsl:attribute name="id">PEPPOL-T110-B14003</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:TaxCategory' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxableAmount" mode="M12" priority="1105">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxableAmount" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@currencyID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@currencyID">
          <xsl:attribute name="id">PEPPOL-T110-B14101</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'currencyID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(@currencyID) or (some $code in $clISO4217 satisfies $code = @currencyID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(@currencyID) or (some $code in $clISO4217 satisfies $code = @currencyID)">
          <xsl:attribute name="id">PEPPOL-T110-B14102</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Value MUST be part of code list 'Currency codes (ISO 4217)'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxAmount" mode="M12" priority="1104">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:TaxTotal/cac:TaxSubtotal/cbc:TaxAmount" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@currencyID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@currencyID">
          <xsl:attribute name="id">PEPPOL-T110-B14301</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'currencyID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(@currencyID) or (some $code in $clISO4217 satisfies $code = @currencyID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(@currencyID) or (some $code in $clISO4217 satisfies $code = @currencyID)">
          <xsl:attribute name="id">PEPPOL-T110-B14302</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Value MUST be part of code list 'Currency codes (ISO 4217)'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory" mode="M12" priority="1103">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">PEPPOL-T110-B14501</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
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
          <xsl:attribute name="id">PEPPOL-T110-B14502</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:TaxScheme' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:ID" mode="M12" priority="1102">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:ID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(some $code in $clUNCL5305 satisfies $code = normalize-space(text()))" />
      <xsl:otherwise>
        <svrl:failed-assert test="(some $code in $clUNCL5305 satisfies $code = normalize-space(text()))">
          <xsl:attribute name="id">PEPPOL-T110-B14601</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Value MUST be part of code list 'Duty or tax or fee category code (UNCL5305)'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:Percent" mode="M12" priority="1101">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:Percent" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReason" mode="M12" priority="1100">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:TaxExemptionReason" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme" mode="M12" priority="1099">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">PEPPOL-T110-B14901</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID" mode="M12" priority="1098">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/*" mode="M12" priority="1097">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B14902</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/*" mode="M12" priority="1096">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B14503</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:TaxTotal/cac:TaxSubtotal/*" mode="M12" priority="1095">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:TaxTotal/cac:TaxSubtotal/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B14004</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:TaxTotal/*" mode="M12" priority="1094">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:TaxTotal/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B13702</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:LegalMonetaryTotal" mode="M12" priority="1093">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:LegalMonetaryTotal" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:LineExtensionAmount" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:LineExtensionAmount">
          <xsl:attribute name="id">PEPPOL-T110-B15101</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
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
          <xsl:attribute name="id">PEPPOL-T110-B15102</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
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
          <xsl:attribute name="id">PEPPOL-T110-B15103</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
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
          <xsl:attribute name="id">PEPPOL-T110-B15104</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:PayableAmount' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:LegalMonetaryTotal/cbc:LineExtensionAmount" mode="M12" priority="1092">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:LegalMonetaryTotal/cbc:LineExtensionAmount" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@currencyID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@currencyID">
          <xsl:attribute name="id">PEPPOL-T110-B15201</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'currencyID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(@currencyID) or (some $code in $clISO4217 satisfies $code = @currencyID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(@currencyID) or (some $code in $clISO4217 satisfies $code = @currencyID)">
          <xsl:attribute name="id">PEPPOL-T110-B15202</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Value MUST be part of code list 'Currency codes (ISO 4217)'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:LegalMonetaryTotal/cbc:TaxExclusiveAmount" mode="M12" priority="1091">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:LegalMonetaryTotal/cbc:TaxExclusiveAmount" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@currencyID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@currencyID">
          <xsl:attribute name="id">PEPPOL-T110-B15401</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'currencyID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(@currencyID) or (some $code in $clISO4217 satisfies $code = @currencyID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(@currencyID) or (some $code in $clISO4217 satisfies $code = @currencyID)">
          <xsl:attribute name="id">PEPPOL-T110-B15402</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Value MUST be part of code list 'Currency codes (ISO 4217)'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:LegalMonetaryTotal/cbc:TaxInclusiveAmount" mode="M12" priority="1090">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:LegalMonetaryTotal/cbc:TaxInclusiveAmount" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@currencyID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@currencyID">
          <xsl:attribute name="id">PEPPOL-T110-B15601</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'currencyID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(@currencyID) or (some $code in $clISO4217 satisfies $code = @currencyID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(@currencyID) or (some $code in $clISO4217 satisfies $code = @currencyID)">
          <xsl:attribute name="id">PEPPOL-T110-B15602</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Value MUST be part of code list 'Currency codes (ISO 4217)'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount" mode="M12" priority="1089">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:LegalMonetaryTotal/cbc:AllowanceTotalAmount" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@currencyID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@currencyID">
          <xsl:attribute name="id">PEPPOL-T110-B15801</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'currencyID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(@currencyID) or (some $code in $clISO4217 satisfies $code = @currencyID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(@currencyID) or (some $code in $clISO4217 satisfies $code = @currencyID)">
          <xsl:attribute name="id">PEPPOL-T110-B15802</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Value MUST be part of code list 'Currency codes (ISO 4217)'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:LegalMonetaryTotal/cbc:ChargeTotalAmount" mode="M12" priority="1088">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:LegalMonetaryTotal/cbc:ChargeTotalAmount" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@currencyID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@currencyID">
          <xsl:attribute name="id">PEPPOL-T110-B16001</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'currencyID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(@currencyID) or (some $code in $clISO4217 satisfies $code = @currencyID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(@currencyID) or (some $code in $clISO4217 satisfies $code = @currencyID)">
          <xsl:attribute name="id">PEPPOL-T110-B16002</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Value MUST be part of code list 'Currency codes (ISO 4217)'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:LegalMonetaryTotal/cbc:PrepaidAmount" mode="M12" priority="1087">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:LegalMonetaryTotal/cbc:PrepaidAmount" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@currencyID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@currencyID">
          <xsl:attribute name="id">PEPPOL-T110-B16201</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'currencyID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(@currencyID) or (some $code in $clISO4217 satisfies $code = @currencyID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(@currencyID) or (some $code in $clISO4217 satisfies $code = @currencyID)">
          <xsl:attribute name="id">PEPPOL-T110-B16202</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Value MUST be part of code list 'Currency codes (ISO 4217)'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:LegalMonetaryTotal/cbc:PayableRoundingAmount" mode="M12" priority="1086">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:LegalMonetaryTotal/cbc:PayableRoundingAmount" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@currencyID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@currencyID">
          <xsl:attribute name="id">PEPPOL-T110-B16401</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'currencyID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(@currencyID) or (some $code in $clISO4217 satisfies $code = @currencyID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(@currencyID) or (some $code in $clISO4217 satisfies $code = @currencyID)">
          <xsl:attribute name="id">PEPPOL-T110-B16402</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Value MUST be part of code list 'Currency codes (ISO 4217)'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:LegalMonetaryTotal/cbc:PayableAmount" mode="M12" priority="1085">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:LegalMonetaryTotal/cbc:PayableAmount" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@currencyID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@currencyID">
          <xsl:attribute name="id">PEPPOL-T110-B16601</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'currencyID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(@currencyID) or (some $code in $clISO4217 satisfies $code = @currencyID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(@currencyID) or (some $code in $clISO4217 satisfies $code = @currencyID)">
          <xsl:attribute name="id">PEPPOL-T110-B16602</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Value MUST be part of code list 'Currency codes (ISO 4217)'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:LegalMonetaryTotal/*" mode="M12" priority="1084">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:LegalMonetaryTotal/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B15105</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine" mode="M12" priority="1083">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:LineItem" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:LineItem">
          <xsl:attribute name="id">PEPPOL-T110-B16801</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:LineItem' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem" mode="M12" priority="1082">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">PEPPOL-T110-B16901</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:Quantity" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:Quantity">
          <xsl:attribute name="id">PEPPOL-T110-B16902</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:Quantity' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:Price" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:Price">
          <xsl:attribute name="id">PEPPOL-T110-B16903</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:Price' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:Item" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:Item">
          <xsl:attribute name="id">PEPPOL-T110-B16904</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:Item' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cbc:ID" mode="M12" priority="1081">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cbc:ID" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cbc:Note" mode="M12" priority="1080">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cbc:Note" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cbc:Quantity" mode="M12" priority="1079">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cbc:Quantity" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@unitCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="@unitCode">
          <xsl:attribute name="id">PEPPOL-T110-B17201</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'unitCode' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(@unitCode) or (some $code in $clUNECERec20 satisfies $code = @unitCode)" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(@unitCode) or (some $code in $clUNECERec20 satisfies $code = @unitCode)">
          <xsl:attribute name="id">PEPPOL-T110-B17202</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Value MUST be part of code list 'Recommandation 20, including Recommondation 21 codes - prefixed with X (UN/ECE)'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cbc:LineExtensionAmount" mode="M12" priority="1078">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cbc:LineExtensionAmount" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@currencyID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@currencyID">
          <xsl:attribute name="id">PEPPOL-T110-B17401</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'currencyID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(@currencyID) or (some $code in $clISO4217 satisfies $code = @currencyID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(@currencyID) or (some $code in $clISO4217 satisfies $code = @currencyID)">
          <xsl:attribute name="id">PEPPOL-T110-B17402</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Value MUST be part of code list 'Currency codes (ISO 4217)'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery" mode="M12" priority="1077">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:Quantity" mode="M12" priority="1076">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cbc:Quantity" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@unitCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="@unitCode">
          <xsl:attribute name="id">PEPPOL-T110-B17701</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'unitCode' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(@unitCode) or (some $code in $clUNECERec20 satisfies $code = @unitCode)" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(@unitCode) or (some $code in $clUNECERec20 satisfies $code = @unitCode)">
          <xsl:attribute name="id">PEPPOL-T110-B17702</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Value MUST be part of code list 'Recommandation 20, including Recommondation 21 codes - prefixed with X (UN/ECE)'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:PromisedDeliveryPeriod" mode="M12" priority="1075">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:PromisedDeliveryPeriod" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:StartDate" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:StartDate">
          <xsl:attribute name="id">PEPPOL-T110-B17901</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:StartDate' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:StartDate" mode="M12" priority="1074">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:StartDate" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:StartTime" mode="M12" priority="1073">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:StartTime" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:EndDate" mode="M12" priority="1072">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:EndDate" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:EndTime" mode="M12" priority="1071">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:PromisedDeliveryPeriod/cbc:EndTime" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:PromisedDeliveryPeriod/*" mode="M12" priority="1070">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/cac:PromisedDeliveryPeriod/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B17902</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/*" mode="M12" priority="1069">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Delivery/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B17601</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price" mode="M12" priority="1068">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:PriceAmount" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:PriceAmount">
          <xsl:attribute name="id">PEPPOL-T110-B18401</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:PriceAmount' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cbc:PriceAmount" mode="M12" priority="1067">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cbc:PriceAmount" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@currencyID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@currencyID">
          <xsl:attribute name="id">PEPPOL-T110-B18501</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'currencyID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(@currencyID) or (some $code in $clISO4217 satisfies $code = @currencyID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(@currencyID) or (some $code in $clISO4217 satisfies $code = @currencyID)">
          <xsl:attribute name="id">PEPPOL-T110-B18502</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Value MUST be part of code list 'Currency codes (ISO 4217)'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cbc:BaseQuantity" mode="M12" priority="1066">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cbc:BaseQuantity" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(@unitCode) or (some $code in $clUNECERec20 satisfies $code = @unitCode)" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(@unitCode) or (some $code in $clUNECERec20 satisfies $code = @unitCode)">
          <xsl:attribute name="id">PEPPOL-T110-B18701</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Value MUST be part of code list 'Recommandation 20, including Recommondation 21 codes - prefixed with X (UN/ECE)'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cbc:PriceType" mode="M12" priority="1065">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cbc:PriceType" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cac:AllowanceCharge" mode="M12" priority="1064">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cac:AllowanceCharge" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ChargeIndicator" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ChargeIndicator">
          <xsl:attribute name="id">PEPPOL-T110-B19001</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
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
          <xsl:attribute name="id">PEPPOL-T110-B19002</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:Amount' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cac:AllowanceCharge/cbc:ChargeIndicator" mode="M12" priority="1063">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cac:AllowanceCharge/cbc:ChargeIndicator" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="normalize-space(text()) = 'false'" />
      <xsl:otherwise>
        <svrl:failed-assert test="normalize-space(text()) = 'false'">
          <xsl:attribute name="id">PEPPOL-T110-B19101</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ChargeIndicator' MUST contain value 'false'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cac:AllowanceCharge/cbc:Amount" mode="M12" priority="1062">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cac:AllowanceCharge/cbc:Amount" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@currencyID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@currencyID">
          <xsl:attribute name="id">PEPPOL-T110-B19201</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'currencyID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(@currencyID) or (some $code in $clISO4217 satisfies $code = @currencyID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(@currencyID) or (some $code in $clISO4217 satisfies $code = @currencyID)">
          <xsl:attribute name="id">PEPPOL-T110-B19202</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Value MUST be part of code list 'Currency codes (ISO 4217)'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cac:AllowanceCharge/cbc:BaseAmount" mode="M12" priority="1061">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cac:AllowanceCharge/cbc:BaseAmount" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@currencyID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@currencyID">
          <xsl:attribute name="id">PEPPOL-T110-B19401</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'currencyID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(@currencyID) or (some $code in $clISO4217 satisfies $code = @currencyID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(@currencyID) or (some $code in $clISO4217 satisfies $code = @currencyID)">
          <xsl:attribute name="id">PEPPOL-T110-B19402</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Value MUST be part of code list 'Currency codes (ISO 4217)'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cac:AllowanceCharge/*" mode="M12" priority="1060">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/cac:AllowanceCharge/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B19003</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/*" mode="M12" priority="1059">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Price/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B18402</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item" mode="M12" priority="1058">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:Name" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:Name">
          <xsl:attribute name="id">PEPPOL-T110-B19601</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:Name' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:Description" mode="M12" priority="1057">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:Description" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:Name" mode="M12" priority="1056">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cbc:Name" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:BuyersItemIdentification" mode="M12" priority="1055">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:BuyersItemIdentification" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">PEPPOL-T110-B19901</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:BuyersItemIdentification/cbc:ID" mode="M12" priority="1054">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:BuyersItemIdentification/cbc:ID" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:BuyersItemIdentification/*" mode="M12" priority="1053">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:BuyersItemIdentification/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B19902</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification" mode="M12" priority="1052">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">PEPPOL-T110-B20101</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:ID" mode="M12" priority="1051">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:ID" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/*" mode="M12" priority="1050">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B20102</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification" mode="M12" priority="1049">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">PEPPOL-T110-B20301</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:ID" mode="M12" priority="1048">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:ID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@schemeID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@schemeID">
          <xsl:attribute name="id">PEPPOL-T110-B20401</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'schemeID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(@schemeID) or (some $code in $clICD satisfies $code = @schemeID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(@schemeID) or (some $code in $clICD satisfies $code = @schemeID)">
          <xsl:attribute name="id">PEPPOL-T110-B20402</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Value MUST be part of code list 'ISO 6523 ICD list'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/*" mode="M12" priority="1047">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B20302</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference" mode="M12" priority="1046">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">PEPPOL-T110-B20601</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference/cbc:ID" mode="M12" priority="1045">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference/cbc:ID" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference/cbc:DocumentType" mode="M12" priority="1044">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference/cbc:DocumentType" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment" mode="M12" priority="1043">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cbc:EmbeddedDocumentBinaryObject" mode="M12" priority="1042">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cbc:EmbeddedDocumentBinaryObject" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@mimeCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="@mimeCode">
          <xsl:attribute name="id">PEPPOL-T110-B21001</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'mimeCode' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(@mimeCode) or (some $code in $clMimeCode satisfies $code = @mimeCode)" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(@mimeCode) or (some $code in $clMimeCode satisfies $code = @mimeCode)">
          <xsl:attribute name="id">PEPPOL-T110-B21002</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Value MUST be part of code list 'Mime code (IANA Subset)'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@filename" />
      <xsl:otherwise>
        <svrl:failed-assert test="@filename">
          <xsl:attribute name="id">PEPPOL-T110-B21003</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'filename' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cac:ExternalReference" mode="M12" priority="1041">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cac:ExternalReference" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI" mode="M12" priority="1040">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cac:ExternalReference/cbc:URI" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cac:ExternalReference/*" mode="M12" priority="1039">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/cac:ExternalReference/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B21301</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/*" mode="M12" priority="1038">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference/cac:Attachment/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B20901</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference/*" mode="M12" priority="1037">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B20602</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:CommodityClassification" mode="M12" priority="1036">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:CommodityClassification" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode" mode="M12" priority="1035">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@listID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@listID">
          <xsl:attribute name="id">PEPPOL-T110-B21601</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'listID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(@listID) or (some $code in $clUNCL7143 satisfies $code = @listID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(@listID) or (some $code in $clUNCL7143 satisfies $code = @listID)">
          <xsl:attribute name="id">PEPPOL-T110-B21602</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Value MUST be part of code list 'Item type identification code (UNCL7143)'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:CommodityClassification/*" mode="M12" priority="1034">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:CommodityClassification/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B21501</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:TransactionConditions" mode="M12" priority="1033">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:TransactionConditions" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ActionCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ActionCode">
          <xsl:attribute name="id">PEPPOL-T110-B21901</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ActionCode' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:TransactionConditions/cbc:ActionCode" mode="M12" priority="1032">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:TransactionConditions/cbc:ActionCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="normalize-space(text()) = 'CT'" />
      <xsl:otherwise>
        <svrl:failed-assert test="normalize-space(text()) = 'CT'">
          <xsl:attribute name="id">PEPPOL-T110-B22001</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ActionCode' MUST contain value 'CT'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:TransactionConditions/*" mode="M12" priority="1031">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:TransactionConditions/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B21902</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory" mode="M12" priority="1030">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">PEPPOL-T110-B22101</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
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
          <xsl:attribute name="id">PEPPOL-T110-B22102</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:TaxScheme' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:ID" mode="M12" priority="1029">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:ID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(some $code in $clUNCL5305 satisfies $code = normalize-space(text()))" />
      <xsl:otherwise>
        <svrl:failed-assert test="(some $code in $clUNCL5305 satisfies $code = normalize-space(text()))">
          <xsl:attribute name="id">PEPPOL-T110-B22201</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Value MUST be part of code list 'Duty or tax or fee category code (UNCL5305)'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:Percent" mode="M12" priority="1028">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cbc:Percent" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme" mode="M12" priority="1027">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">PEPPOL-T110-B22401</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID" mode="M12" priority="1026">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/cbc:ID" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/*" mode="M12" priority="1025">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B22402</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/*" mode="M12" priority="1024">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B22103</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty" mode="M12" priority="1023">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:Name" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:Name">
          <xsl:attribute name="id">PEPPOL-T110-B22601</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
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
          <xsl:attribute name="id">PEPPOL-T110-B22602</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:Value' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty/cbc:Name" mode="M12" priority="1022">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty/cbc:Name" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty/cbc:NameCode" mode="M12" priority="1021">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty/cbc:NameCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@listID" />
      <xsl:otherwise>
        <svrl:failed-assert test="@listID">
          <xsl:attribute name="id">PEPPOL-T110-B22801</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'listID' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty/cbc:Value" mode="M12" priority="1020">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty/cbc:Value" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty/cbc:ValueQuantity" mode="M12" priority="1019">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty/cbc:ValueQuantity" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="@unitCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="@unitCode">
          <xsl:attribute name="id">PEPPOL-T110-B23101</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Attribute 'unitCode' MUST be present.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(@unitCode) or (some $code in $clUNECERec20 satisfies $code = @unitCode)" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(@unitCode) or (some $code in $clUNECERec20 satisfies $code = @unitCode)">
          <xsl:attribute name="id">PEPPOL-T110-B23102</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Value MUST be part of code list 'Recommandation 20, including Recommondation 21 codes - prefixed with X (UN/ECE)'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty/cbc:ValueQualifier" mode="M12" priority="1018">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty/cbc:ValueQualifier" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty/*" mode="M12" priority="1017">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B22603</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:Certificate" mode="M12" priority="1016">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:Certificate" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">PEPPOL-T110-B23401</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
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
          <xsl:attribute name="id">PEPPOL-T110-B23402</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
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
          <xsl:attribute name="id">PEPPOL-T110-B23403</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
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
          <xsl:attribute name="id">PEPPOL-T110-B23404</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:IssuerParty' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:Certificate/cbc:ID" mode="M12" priority="1015">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:Certificate/cbc:ID" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:Certificate/cbc:CertificateTypeCode" mode="M12" priority="1014">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:Certificate/cbc:CertificateTypeCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="normalize-space(text()) = 'NA'" />
      <xsl:otherwise>
        <svrl:failed-assert test="normalize-space(text()) = 'NA'">
          <xsl:attribute name="id">PEPPOL-T110-B23601</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:CertificateTypeCode' MUST contain value 'NA'.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:Certificate/cbc:CertificateType" mode="M12" priority="1013">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:Certificate/cbc:CertificateType" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:Certificate/cbc:Remarks" mode="M12" priority="1012">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:Certificate/cbc:Remarks" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:Certificate/cac:IssuerParty" mode="M12" priority="1011">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:Certificate/cac:IssuerParty" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cac:PartyName" />
      <xsl:otherwise>
        <svrl:failed-assert test="cac:PartyName">
          <xsl:attribute name="id">PEPPOL-T110-B23901</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cac:PartyName' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:Certificate/cac:IssuerParty/cac:PartyName" mode="M12" priority="1010">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:Certificate/cac:IssuerParty/cac:PartyName" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:Name" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:Name">
          <xsl:attribute name="id">PEPPOL-T110-B24001</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:Name' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:Certificate/cac:IssuerParty/cac:PartyName/cbc:Name" mode="M12" priority="1009">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:Certificate/cac:IssuerParty/cac:PartyName/cbc:Name" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:Certificate/cac:IssuerParty/*" mode="M12" priority="1008">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:Certificate/cac:IssuerParty/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B23902</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:Certificate/cac:DocumentReference" mode="M12" priority="1007">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:Certificate/cac:DocumentReference" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:ID">
          <xsl:attribute name="id">PEPPOL-T110-B24201</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Element 'cbc:ID' MUST be provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:Certificate/cac:DocumentReference/cbc:ID" mode="M12" priority="1006">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:Certificate/cac:DocumentReference/cbc:ID" />
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:Certificate/cac:DocumentReference/*" mode="M12" priority="1005">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:Certificate/cac:DocumentReference/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B24202</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:Certificate/*" mode="M12" priority="1004">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/cac:Certificate/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B23405</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/*" mode="M12" priority="1003">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/cac:Item/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B19602</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/*" mode="M12" priority="1002">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/cac:LineItem/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B16905</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:OrderLine/*" mode="M12" priority="1001">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:OrderLine/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B16802</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/*" mode="M12" priority="1000">
    <svrl:fired-rule context="/ubl:OrderResponse/*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-B00110</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document MUST NOT contain elements not part of the data model.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>
  <xsl:template match="text()" mode="M12" priority="-1" />
  <xsl:template match="@*|node()" mode="M12" priority="-2">
    <xsl:apply-templates mode="M12" select="*" />
  </xsl:template>

<!--PATTERN -->
<xsl:variable name="taxCategoryPercents" select="for $cat in /ubl:OrderResponse/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory return u:cat2str($cat)" />
  <xsl:variable name="taxCategories" select="for $cat in /ubl:OrderResponse/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory return normalize-space($cat/cbc:ID)" />
  <xsl:variable name="documentCurrencyCode" select="/ubl:OrderResponse/cbc:DocumentCurrencyCode" />

	<!--RULE -->
<xsl:template match="cac:Item" mode="M13" priority="1014">
    <svrl:fired-rule context="cac:Item" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(cac:StandardItemIdentification/cbc:ID) or  (cac:SellersItemIdentification/cbc:ID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="(cac:StandardItemIdentification/cbc:ID) or (cac:SellersItemIdentification/cbc:ID)">
          <xsl:attribute name="id">PEPPOL-T110-R002</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Each item in an Order agreement line SHALL be identifiable by either “item sellers identifier” or “item standard identifier”</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M13" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cbc:Amount | cbc:TaxAmount | cbc:TaxableAmount | cbc:LineExtensionAmount | cbc:PriceAmount | cbc:BaseAmount | cac:LegalMonetaryTotal/cbc:*" mode="M13" priority="1013">
    <svrl:fired-rule context="cbc:Amount | cbc:TaxAmount | cbc:TaxableAmount | cbc:LineExtensionAmount | cbc:PriceAmount | cbc:BaseAmount | cac:LegalMonetaryTotal/cbc:*" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(@currencyID) or @currencyID = $documentCurrencyCode" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(@currencyID) or @currencyID = $documentCurrencyCode">
          <xsl:attribute name="id">PEPPOL-T110-R004</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>All amounts SHALL have same currency code as document currency</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="ancestor::node()/local-name() = 'Price' or string-length(substring-after(., '.')) &lt;= 2" />
      <xsl:otherwise>
        <svrl:failed-assert test="ancestor::node()/local-name() = 'Price' or string-length(substring-after(., '.')) &lt;= 2">
          <xsl:attribute name="id">PEPPOL-T110-R013</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Elements of data type amount cannot have more than 2 decimals (I.e. all amounts except unit price amounts)</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M13" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:TaxTotal/cac:TaxSubtotal" mode="M13" priority="1012">
    <svrl:fired-rule context="cac:TaxTotal/cac:TaxSubtotal" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(round(cac:TaxCategory/xs:decimal(cbc:Percent)) = 0 and (round(xs:decimal(cbc:TaxAmount)) = 0)) or (round(cac:TaxCategory/xs:decimal(cbc:Percent)) != 0 and (xs:decimal(cbc:TaxAmount) = round(xs:decimal(cbc:TaxableAmount) * (cac:TaxCategory/xs:decimal(cbc:Percent) div 100) * 10 * 10) div 100 )) or (not(exists(cac:TaxCategory/xs:decimal(cbc:Percent))) and (round(xs:decimal(cbc:TaxAmount)) = 0))" />
      <xsl:otherwise>
        <svrl:failed-assert test="(round(cac:TaxCategory/xs:decimal(cbc:Percent)) = 0 and (round(xs:decimal(cbc:TaxAmount)) = 0)) or (round(cac:TaxCategory/xs:decimal(cbc:Percent)) != 0 and (xs:decimal(cbc:TaxAmount) = round(xs:decimal(cbc:TaxableAmount) * (cac:TaxCategory/xs:decimal(cbc:Percent) div 100) * 10 * 10) div 100 )) or (not(exists(cac:TaxCategory/xs:decimal(cbc:Percent))) and (round(xs:decimal(cbc:TaxAmount)) = 0))">
          <xsl:attribute name="id">PEPPOL-T110-R024</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>VAT category tax amount = VAT category taxable amount  x (VAT category rate  / 100), rounded to two decimals.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M13" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:TaxTotal[cac:TaxSubtotal]" mode="M13" priority="1011">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:TaxTotal[cac:TaxSubtotal]" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(xs:decimal(child::cbc:TaxAmount)= round((sum(cac:TaxSubtotal/xs:decimal(cbc:TaxAmount)) * 10 * 10)) div 100) or not(cac:TaxSubtotal)" />
      <xsl:otherwise>
        <svrl:failed-assert test="(xs:decimal(child::cbc:TaxAmount)= round((sum(cac:TaxSubtotal/xs:decimal(cbc:TaxAmount)) * 10 * 10)) div 100) or not(cac:TaxSubtotal)">
          <xsl:attribute name="id">PEPPOL-T110-R025</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>If VAT breakdown is present, the order agreement VAT total amount  = Σ VAT category tax amount.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M13" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:TaxSubtotal/cac:TaxCategory[not(cbc:TaxExemptionReason)]" mode="M13" priority="1010">
    <svrl:fired-rule context="cac:TaxSubtotal/cac:TaxCategory[not(cbc:TaxExemptionReason)]" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="contains( ' S Z L M ',concat(' ',normalize-space(cbc:ID),' '))" />
      <xsl:otherwise>
        <svrl:failed-assert test="contains( ' S Z L M ',concat(' ',normalize-space(cbc:ID),' '))">
          <xsl:attribute name="id">PEPPOL-T110-R028</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>A VATBReakdown with VAT Category codes E, AE, K, G or O SHALL have a VAT exemption reason text </svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M13" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:TaxSubtotal/cac:TaxCategory[cbc:TaxExemptionReason]" mode="M13" priority="1009">
    <svrl:fired-rule context="cac:TaxSubtotal/cac:TaxCategory[cbc:TaxExemptionReason]" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="contains( ' E AE O K G ',concat(' ',normalize-space(cbc:ID),' '))" />
      <xsl:otherwise>
        <svrl:failed-assert test="contains( ' E AE O K G ',concat(' ',normalize-space(cbc:ID),' '))">
          <xsl:attribute name="id">PEPPOL-T110-R029</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>A VATBReakdown with VAT Category codes S, Z, L and M SHALL NOT have a VAT exemption reason text </svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M13" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:AllowanceCharge/cac:TaxCategory[cbc:Percent] | cac:Item/cac:ClassifiedTaxCategory[cbc:Percent]" mode="M13" priority="1008">
    <svrl:fired-rule context="cac:AllowanceCharge/cac:TaxCategory[cbc:Percent] | cac:Item/cac:ClassifiedTaxCategory[cbc:Percent]" />
    <xsl:variable name="category" select="u:cat2str(.)" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="some $cat in $taxCategoryPercents satisfies $cat = $category" />
      <xsl:otherwise>
        <svrl:failed-assert test="some $cat in $taxCategoryPercents satisfies $cat = $category">
          <xsl:attribute name="id">PEPPOL-T110-R026</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Tax categories MUST match provided tax categories on document level.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M13" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:AllowanceCharge/cac:TaxCategory | cac:Item/cac:ClassifiedTaxCategory" mode="M13" priority="1007">
    <svrl:fired-rule context="cac:AllowanceCharge/cac:TaxCategory | cac:Item/cac:ClassifiedTaxCategory" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="some $cat in $taxCategories satisfies $cat = cbc:ID" />
      <xsl:otherwise>
        <svrl:failed-assert test="some $cat in $taxCategories satisfies $cat = cbc:ID">
          <xsl:attribute name="id">PEPPOL-T110-R027</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Tax categories MUST match provided tax categories on document level.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="cbc:Percent or (normalize-space(cbc:ID)='O')" />
      <xsl:otherwise>
        <svrl:failed-assert test="cbc:Percent or (normalize-space(cbc:ID)='O')">
          <xsl:attribute name="id">PEPPOL-T110-R019</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Each Tax Category SHALL have a VAT category rate, except if the order is not subject to VAT.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(normalize-space(cbc:ID)='S') or (cbc:Percent) > 0" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(normalize-space(cbc:ID)='S') or (cbc:Percent) > 0">
          <xsl:attribute name="id">PEPPOL-T110-R020</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>When VAT category code is "Standard rated" (S) the VAT rate SHALL be greater than zero.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M13" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:LegalMonetaryTotal" mode="M13" priority="1006">
    <svrl:fired-rule context="cac:LegalMonetaryTotal" />
    <xsl:variable name="lineExtensionAmount" select="xs:decimal(if (cbc:LineExtensionAmount) then cbc:LineExtensionAmount else 0)" />
    <xsl:variable name="allowanceTotalAmount" select="xs:decimal(if (cbc:AllowanceTotalAmount) then cbc:AllowanceTotalAmount else 0)" />
    <xsl:variable name="chargeTotalAmount" select="xs:decimal(if (cbc:ChargeTotalAmount) then cbc:ChargeTotalAmount else 0)" />
    <xsl:variable name="taxExclusiveAmount" select="xs:decimal(if (cbc:TaxExclusiveAmount) then cbc:TaxExclusiveAmount else 0)" />
    <xsl:variable name="taxInclusiveAmount" select="xs:decimal(if (cbc:TaxInclusiveAmount) then cbc:TaxInclusiveAmount else 0)" />
    <xsl:variable name="payableRoundingAmount" select="xs:decimal(if (cbc:PayableRoundingAmount) then cbc:PayableRoundingAmount else 0)" />
    <xsl:variable name="payableAmount" select="xs:decimal(if (cbc:PayableAmount) then cbc:PayableAmount else 0)" />
    <xsl:variable name="prepaidAmount" select="xs:decimal(if (cbc:PrepaidAmount) then cbc:PrepaidAmount else 0)" />
    <xsl:variable name="taxTotal" select="xs:decimal(if (/ubl:OrderResponse/cac:TaxTotal/cbc:TaxAmount) then (/ubl:OrderResponse/cac:TaxTotal/cbc:TaxAmount) else 0)" />
    <xsl:variable name="allowanceTotal" select="round(sum(/ubl:OrderResponse/cac:AllowanceCharge[cbc:ChargeIndicator='false']/cbc:Amount/xs:decimal(.))* 10 * 10) div 100" />
    <xsl:variable name="chargeTotal" select="round(sum(/ubl:OrderResponse/cac:AllowanceCharge[cbc:ChargeIndicator='true']/cbc:Amount/xs:decimal(.)) * 10 * 10) div 100" />
    <xsl:variable name="lineExtensionTotal" select="round(sum(//cac:OrderLine/cac:LineItem/cbc:LineExtensionAmount/xs:decimal(.)) * 10 * 10) div 100" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="count(//cac:OrderLine) = count(//cac:LineItem/cbc:LineExtensionAmount)" />
      <xsl:otherwise>
        <svrl:failed-assert test="count(//cac:OrderLine) = count(//cac:LineItem/cbc:LineExtensionAmount)">
          <xsl:attribute name="id">PEPPOL-T110-R014</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>If document totals is provided, all order agreement lines SHALL have a line extension amount</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(cbc:PayableAmount) or cbc:PayableAmount >= 0" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(cbc:PayableAmount) or cbc:PayableAmount >= 0">
          <xsl:attribute name="id">PEPPOL-T110-R005</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Total amount for payment SHALL NOT be negative, if expected total amount for payment is provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="$lineExtensionAmount >= 0" />
      <xsl:otherwise>
        <svrl:failed-assert test="$lineExtensionAmount >= 0">
          <xsl:attribute name="id">PEPPOL-T110-R006</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Total amount for payment SHALL NOT be negative, if expected total amount for payment is provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(cbc:LineExtensionAmount) or $lineExtensionAmount = $lineExtensionTotal" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(cbc:LineExtensionAmount) or $lineExtensionAmount = $lineExtensionTotal">
          <xsl:attribute name="id">PEPPOL-T110-R007</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Total sum of line amounts SHALL equal the sum of the order line amounts at order line level, if total sum of line amounts is provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(cbc:ChargeTotalAmount) or $chargeTotalAmount = $chargeTotal" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(cbc:ChargeTotalAmount) or $chargeTotalAmount = $chargeTotal">
          <xsl:attribute name="id">PEPPOL-T110-R008</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Total sum of charges at document level SHALL be equal to the sum of charges at document level, if total sum of charges at document level is provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(cbc:AllowanceTotalAmount) or $allowanceTotalAmount = $allowanceTotal" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(cbc:AllowanceTotalAmount) or $allowanceTotalAmount = $allowanceTotal">
          <xsl:attribute name="id">PEPPOL-T110-R009</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Total sum of allowance at document level SHALL be equal to the sum of allowance amounts at document level, if total sum of allowance at document level is provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(cbc:TaxExclusiveAmount) or $taxExclusiveAmount = $lineExtensionAmount + $chargeTotalAmount - $allowanceTotalAmount" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(cbc:TaxExclusiveAmount) or $taxExclusiveAmount = $lineExtensionAmount + $chargeTotalAmount - $allowanceTotalAmount">
          <xsl:attribute name="id">PEPPOL-T110-R010</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Tax exclusive amount SHALL equal the sum of line amount plus total charge amount at document level less total allowance amount at document level if tax exclusive amount is provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="$taxInclusiveAmount = $taxExclusiveAmount + $taxTotal" />
      <xsl:otherwise>
        <svrl:failed-assert test="$taxInclusiveAmount = $taxExclusiveAmount + $taxTotal">
          <xsl:attribute name="id">PEPPOL-T110-R011</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Tax inclusive amount SHALL equal tax exclusive amount plus total tax amount.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(cbc:PayableAmount) or $payableAmount = $taxInclusiveAmount - $prepaidAmount + $payableRoundingAmount" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(cbc:PayableAmount) or $payableAmount = $taxInclusiveAmount - $prepaidAmount + $payableRoundingAmount">
          <xsl:attribute name="id">PEPPOL-T110-R012</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Total amount for payment SHALL be equal to the tax inclusive amount minus the prepaid amount plus rounding amount</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M13" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:AllowanceCharge[cbc:MultiplierFactorNumeric and not(cbc:BaseAmount)]" mode="M13" priority="1005">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:AllowanceCharge[cbc:MultiplierFactorNumeric and not(cbc:BaseAmount)]" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-R015</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Allowance/charge base amount SHALL be provided when allowance/charge percentage is provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M13" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:AllowanceCharge[not(cbc:MultiplierFactorNumeric) and cbc:BaseAmount]" mode="M13" priority="1004">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:AllowanceCharge[not(cbc:MultiplierFactorNumeric) and cbc:BaseAmount]" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="false()" />
      <xsl:otherwise>
        <svrl:failed-assert test="false()">
          <xsl:attribute name="id">PEPPOL-T110-R016</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Allowance/charge percentage SHALL be provided when allowance/charge base amount is provided.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M13" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:OrderResponse/cac:AllowanceCharge" mode="M13" priority="1003">
    <svrl:fired-rule context="/ubl:OrderResponse/cac:AllowanceCharge" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(cbc:MultiplierFactorNumeric and cbc:BaseAmount) or u:slack(if (cbc:Amount) then cbc:Amount else 0, (xs:decimal(cbc:BaseAmount) * xs:decimal(cbc:MultiplierFactorNumeric)) div 100, 0.02)" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(cbc:MultiplierFactorNumeric and cbc:BaseAmount) or u:slack(if (cbc:Amount) then cbc:Amount else 0, (xs:decimal(cbc:BaseAmount) * xs:decimal(cbc:MultiplierFactorNumeric)) div 100, 0.02)">
          <xsl:attribute name="id">PEPPOL-T110-R017</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Allowance/charge amount SHALL equal base amount * percentage/100 if base amount and percentage exists</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="exists(cbc:AllowanceChargeReason) or exists(cbc:AllowanceChargeReasonCode)" />
      <xsl:otherwise>
        <svrl:failed-assert test="exists(cbc:AllowanceChargeReason) or exists(cbc:AllowanceChargeReasonCode)">
          <xsl:attribute name="id">PEPPOL-T110-R018</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Each document level allowance SHALL have an allowance reason text or an allowance reason code.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="number(cbc:Amount) >= 0" />
      <xsl:otherwise>
        <svrl:failed-assert test="number(cbc:Amount) >= 0">
          <xsl:attribute name="id">PEPPOL-T110-R021</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Document level allowance or charge amounts SHALL NOT be negative.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M13" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:Price" mode="M13" priority="1002">
    <svrl:fired-rule context="cac:Price" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="number(cbc:PriceAmount) >=0" />
      <xsl:otherwise>
        <svrl:failed-assert test="number(cbc:PriceAmount) >=0">
          <xsl:attribute name="id">PEPPOL-T110-R001</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Each order agreement line item net price SHALL not be negative
		</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(cac:AllowanceCharge/cbc:BaseAmount) >= 0 or not(exists(cac:AllowanceCharge/cbc:BaseAmount))" />
      <xsl:otherwise>
        <svrl:failed-assert test="(cac:AllowanceCharge/cbc:BaseAmount) >= 0 or not(exists(cac:AllowanceCharge/cbc:BaseAmount))">
          <xsl:attribute name="id">PEPPOL-T110-R022</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>The Item gross price SHALL NOT be negative.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="number(cac:AllowanceCharge/cbc:Amount) >= 0 or not(exists(cac:AllowanceCharge/cbc:Amount))" />
      <xsl:otherwise>
        <svrl:failed-assert test="number(cac:AllowanceCharge/cbc:Amount) >= 0 or not(exists(cac:AllowanceCharge/cbc:Amount))">
          <xsl:attribute name="id">PEPPOL-T110-R023</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Allowance or charge price amounts SHALL NOT be negative.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M13" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:AllowanceCharge[cbc:ChargeIndicator = 'false']/cbc:AllowanceChargeReasonCode" mode="M13" priority="1001">
    <svrl:fired-rule context="cac:AllowanceCharge[cbc:ChargeIndicator = 'false']/cbc:AllowanceChargeReasonCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="    some $code in $clUNCL5189    satisfies normalize-space(text()) = $code" />
      <xsl:otherwise>
        <svrl:failed-assert test="some $code in $clUNCL5189 satisfies normalize-space(text()) = $code">
          <xsl:attribute name="id">PEPPOL-T110-CL001</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Reason code MUST be according to subset of UNCL 5189 D.16B.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M13" select="*" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:AllowanceCharge[cbc:ChargeIndicator = 'true']/cbc:AllowanceChargeReasonCode" mode="M13" priority="1000">
    <svrl:fired-rule context="cac:AllowanceCharge[cbc:ChargeIndicator = 'true']/cbc:AllowanceChargeReasonCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="    some $code in $clUNCL7161    satisfies normalize-space(text()) = $code" />
      <xsl:otherwise>
        <svrl:failed-assert test="some $code in $clUNCL7161 satisfies normalize-space(text()) = $code">
          <xsl:attribute name="id">PEPPOL-T110-CL002</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>Reason code MUST be according to UNCL 7161 D.16B.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M13" select="*" />
  </xsl:template>
  <xsl:template match="text()" mode="M13" priority="-1" />
  <xsl:template match="@*|node()" mode="M13" priority="-2">
    <xsl:apply-templates mode="M13" select="*" />
  </xsl:template>
</xsl:stylesheet>
