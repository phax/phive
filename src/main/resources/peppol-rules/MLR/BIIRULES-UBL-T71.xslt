<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet version="1.0" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:cec="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:ubl="urn:oasis:names:specification:ubl:schema:xsd:ApplicationResponse-2" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
    <svrl:schematron-output schemaVersion="" title="BIIRULES T71 bound to UBL">
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
      <svrl:ns-prefix-in-attribute-values prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:ApplicationResponse-2" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:attribute name="id">Codes-T71</xsl:attribute>
        <xsl:attribute name="name">Codes-T71</xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M8" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:attribute name="id">UBL-T71</xsl:attribute>
        <xsl:attribute name="name">UBL-T71</xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M9" select="/" />
    </svrl:schematron-output>
  </xsl:template>

<!--SCHEMATRON PATTERNS-->
<svrl:text>BIIRULES T71 bound to UBL</svrl:text>

<!--PATTERN Codes-T71-->


	<!--RULE -->
<xsl:template match="cac:DocumentResponse/cac:DocumentReference/cbc:DocumentTypeCode" mode="M8" priority="1001">
    <svrl:fired-rule context="cac:DocumentResponse/cac:DocumentReference/cbc:DocumentTypeCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="contains('�1�10�100�101�102�103�104�105�106�107�108�109�11�110�111�112�113�114�115�116�117�118�119�12�120�121�122�123�124�125�126�127�128�129�13�130�131�132�133�134�135�136�137�138�139�14�140�141�142�143�144�145�146�147�148�149�15�150�151�152�153�154�155�156�157�158�159�16�160�161�162�163�164�165�166�167�168�169�17�170�171�172�173�174�175�176�177�178�179�18�180�181�182�183�184�185�186�187�188�189�19�190�191�192�193�194�195�196�197�198�199�2�20�200�201�202�203�204�205�206�207�208�209�21�210�211�212�213�214�215�216�217�218�219�22�220�221�222�223�224�225�226�227�228�229�23�230�231�232�233�234�235�236�237�238�239�24�240�241�242�243�244�245�246�247�248�249�25�250�251�252�253�254�255�256�257�258�259�26�260�261�262�263�264�265�266�267�268�269�27�270�271�272�273�274�275�276�277�278�279�28�280�281�282�283�284�285�286�287�288�289�29�290�291�292�293�294�295�296�297�298�299�3�30�300�301�302�303�304�305�306�307�308�309�31�310�311�312�313�314�315�316�317�318�319�32�320�321�322�323�324�325�326�327�328�329�33�330�331�332�333�334�335�336�337�338�339�34�340�341�342�343�344�345�346�347�348�349�35�350�351�352�353�354�355�356�357�358�359�36�360�361�362�363�364�365�366�367�368�369�37�370�371�372�373�374�375�376�377�378�379�38�380�381�382�383�384�385�386�387�388�389�39�390�391�392�393�394�395�396�397�398�399�4�40�400�401�402�403�404�405�406�407�408�409�41�410�411�412�413�414�415�416�417�418�419�42�420�421�422�423�424�425�426�427�428�429�43�430�431�432�433�434�435�436�437�438�439�44�440�441�442�443�444�445�446�447�448�449�45�450�451�452�453�454�455�456�457�458�459�46�460�461�462�463�464�465�466�467�468�469�47�470�48�481�482�483�484�485�486�487�488�489�49�490�491�493�494�495�496�497�498�499�5�50�51�52�520�521�522�523�524�525�526�527�528�529�53�530�531�532�533�534�535�536�537�538�54�55�550�56�57�575�58�580�59�6�60�61�610�62�621�622�623�624�63�630�631�632�633�635�64�640�65�650�655�66�67�68�69�7�70�700�701�702�703�704�705�706�707�708�709�71�710�711�712�713�714�715�716�72�720�722�723�724�73�730�74�740�741�743�744�745�746�75�750�76�760�761�763�764�765�766�77�770�775�78�780�781�782�783�784�785�786�787�788�789�79�790�791�792�793�794�795�796�797�798�799�8�80�81�810�811�812�82�820�821�822�823�824�825�83�830�833�84�840�841�85�850�851�852�853�855�856�86�860�861�862�863�864�865�87�870�88�89�890�895�896�9�90�901�91�910�911�913�914�915�916�917�92�925�926�927�929�93�930�931�932�933�934�935�936�937�938�94�940�941�95�950�951�952�953�954�955�96�960�961�962�963�964�965�966�97�970�971�972�974�975�976�977�978�979�98�99�990�991�995�996�998�',concat('�',normalize-space(.),'�'))" />
      <xsl:otherwise>
        <svrl:failed-assert test="contains('�1�10�100�101�102�103�104�105�106�107�108�109�11�110�111�112�113�114�115�116�117�118�119�12�120�121�122�123�124�125�126�127�128�129�13�130�131�132�133�134�135�136�137�138�139�14�140�141�142�143�144�145�146�147�148�149�15�150�151�152�153�154�155�156�157�158�159�16�160�161�162�163�164�165�166�167�168�169�17�170�171�172�173�174�175�176�177�178�179�18�180�181�182�183�184�185�186�187�188�189�19�190�191�192�193�194�195�196�197�198�199�2�20�200�201�202�203�204�205�206�207�208�209�21�210�211�212�213�214�215�216�217�218�219�22�220�221�222�223�224�225�226�227�228�229�23�230�231�232�233�234�235�236�237�238�239�24�240�241�242�243�244�245�246�247�248�249�25�250�251�252�253�254�255�256�257�258�259�26�260�261�262�263�264�265�266�267�268�269�27�270�271�272�273�274�275�276�277�278�279�28�280�281�282�283�284�285�286�287�288�289�29�290�291�292�293�294�295�296�297�298�299�3�30�300�301�302�303�304�305�306�307�308�309�31�310�311�312�313�314�315�316�317�318�319�32�320�321�322�323�324�325�326�327�328�329�33�330�331�332�333�334�335�336�337�338�339�34�340�341�342�343�344�345�346�347�348�349�35�350�351�352�353�354�355�356�357�358�359�36�360�361�362�363�364�365�366�367�368�369�37�370�371�372�373�374�375�376�377�378�379�38�380�381�382�383�384�385�386�387�388�389�39�390�391�392�393�394�395�396�397�398�399�4�40�400�401�402�403�404�405�406�407�408�409�41�410�411�412�413�414�415�416�417�418�419�42�420�421�422�423�424�425�426�427�428�429�43�430�431�432�433�434�435�436�437�438�439�44�440�441�442�443�444�445�446�447�448�449�45�450�451�452�453�454�455�456�457�458�459�46�460�461�462�463�464�465�466�467�468�469�47�470�48�481�482�483�484�485�486�487�488�489�49�490�491�493�494�495�496�497�498�499�5�50�51�52�520�521�522�523�524�525�526�527�528�529�53�530�531�532�533�534�535�536�537�538�54�55�550�56�57�575�58�580�59�6�60�61�610�62�621�622�623�624�63�630�631�632�633�635�64�640�65�650�655�66�67�68�69�7�70�700�701�702�703�704�705�706�707�708�709�71�710�711�712�713�714�715�716�72�720�722�723�724�73�730�74�740�741�743�744�745�746�75�750�76�760�761�763�764�765�766�77�770�775�78�780�781�782�783�784�785�786�787�788�789�79�790�791�792�793�794�795�796�797�798�799�8�80�81�810�811�812�82�820�821�822�823�824�825�83�830�833�84�840�841�85�850�851�852�853�855�856�86�860�861�862�863�864�865�87�870�88�89�890�895�896�9�90�901�91�910�911�913�914�915�916�917�92�925�926�927�929�93�930�931�932�933�934�935�936�937�938�94�940�941�95�950�951�952�953�954�955�96�960�961�962�963�964�965�966�97�970�971�972�974�975�976�977�978�979�98�99�990�991�995�996�998�',concat('�',normalize-space(.),'�'))">
          <xsl:attribute name="id">CL-T71-R001</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[CL-T71-R001]-A document type code MUST be coded using UNCL 1001 list BII2 subset</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M8" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:DocumentResponse/cac:Response/cbc:ResponseCode" mode="M8" priority="1000">
    <svrl:fired-rule context="cac:DocumentResponse/cac:Response/cbc:ResponseCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="contains('�AP�RE�',concat('�',normalize-space(.),'�'))" />
      <xsl:otherwise>
        <svrl:failed-assert test="contains('�AP�RE�',concat('�',normalize-space(.),'�'))">
          <xsl:attribute name="id">CL-T71-R002</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[CL-T71-R002]-A Response Code MUST be from the UNCL 4343 PEPPOL Subset code list</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M8" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M8" priority="-1" />
  <xsl:template match="@*|node()" mode="M8" priority="-2">
    <xsl:apply-templates mode="M8" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN UBL-T71-->


	<!--RULE -->
<xsl:template match="//cac:ReceiverParty" mode="M9" priority="1002">
    <svrl:fired-rule context="//cac:ReceiverParty" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(cac:PartyName/cbc:Name) or (cac:PartyIdentification/cbc:ID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="(cac:PartyName/cbc:Name) or (cac:PartyIdentification/cbc:ID)">
          <xsl:attribute name="id">BII2-T71-R008</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T71-R008]-A message level response receiving party MUST contain the full name or an identifier</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M9" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="//cac:SenderParty" mode="M9" priority="1001">
    <svrl:fired-rule context="//cac:SenderParty" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(cac:PartyName/cbc:Name) or (cac:PartyIdentification/cbc:ID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="(cac:PartyName/cbc:Name) or (cac:PartyIdentification/cbc:ID)">
          <xsl:attribute name="id">BII2-T71-R007</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T71-R007]-A message level response sending party MUST contain the full name or an identifier</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M9" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="/ubl:ApplicationResponse" mode="M9" priority="1000">
    <svrl:fired-rule context="/ubl:ApplicationResponse" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(cbc:ProfileID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="(cbc:ProfileID)">
          <xsl:attribute name="id">BII2-T71-R001</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T71-R001]-A message level response MUST have a profile identifier</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(cbc:CustomizationID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="(cbc:CustomizationID)">
          <xsl:attribute name="id">BII2-T71-R002</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T71-R002]-A message level response MUST have a customization identifier</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(cbc:IssueDate)" />
      <xsl:otherwise>
        <svrl:failed-assert test="(cbc:IssueDate)">
          <xsl:attribute name="id">BII2-T71-R003</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T71-R003]-A message level response MUST contain the date of issue</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(cbc:ID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="(cbc:ID)">
          <xsl:attribute name="id">BII2-T71-R004</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T71-R004]-A message level response MUST contain the response identifier</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(cac:SenderParty)" />
      <xsl:otherwise>
        <svrl:failed-assert test="(cac:SenderParty)">
          <xsl:attribute name="id">BII2-T71-R005</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T71-R005]-The party sending the message level response  MUST be specified</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(cac:ReceiverParty)" />
      <xsl:otherwise>
        <svrl:failed-assert test="(cac:ReceiverParty)">
          <xsl:attribute name="id">BII2-T71-R006</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T71-R006]-The party receiving the message level response  MUST be specified</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(cac:DocumentResponse/cac:DocumentReference/cbc:ID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="(cac:DocumentResponse/cac:DocumentReference/cbc:ID)">
          <xsl:attribute name="id">BII2-T71-R010</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T71-R010]-A message level response MUST contain a document reference pointing towards the business message that the response relates to</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(cac:DocumentResponse/cac:Response/cbc:ResponseCode)" />
      <xsl:otherwise>
        <svrl:failed-assert test="(cac:DocumentResponse/cac:Response/cbc:ResponseCode)">
          <xsl:attribute name="id">BII2-T71-R012</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T71-R012]-A response document MUST be able to clearly indicate whether the received document was accepted or not.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M9" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M9" priority="-1" />
  <xsl:template match="@*|node()" mode="M9" priority="-2">
    <xsl:apply-templates mode="M9" select="*|comment()|processing-instruction()" />
  </xsl:template>
</xsl:stylesheet>
