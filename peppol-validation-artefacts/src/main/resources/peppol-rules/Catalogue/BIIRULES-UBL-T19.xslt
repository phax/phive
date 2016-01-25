<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet version="1.0" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:cec="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xmlns:ubl="urn:oasis:names:specification:ubl:schema:xsd:Catalogue-2" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
    <svrl:schematron-output schemaVersion="" title="BIIRULES T19 bound to UBL">
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
      <svrl:ns-prefix-in-attribute-values prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:Catalogue-2" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:attribute name="id">Codes-T19</xsl:attribute>
        <xsl:attribute name="name">Codes-T19</xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M8" select="/" />
      <svrl:active-pattern>
        <xsl:attribute name="document">
          <xsl:value-of select="document-uri(/)" />
        </xsl:attribute>
        <xsl:attribute name="id">UBL-T19</xsl:attribute>
        <xsl:attribute name="name">UBL-T19</xsl:attribute>
        <xsl:apply-templates />
      </svrl:active-pattern>
      <xsl:apply-templates mode="M9" select="/" />
    </svrl:schematron-output>
  </xsl:template>

<!--SCHEMATRON PATTERNS-->
<svrl:text>BIIRULES T19 bound to UBL</svrl:text>

<!--PATTERN Codes-T19-->


	<!--RULE -->
<xsl:template match="cac:CatalogueLine/cbc:ActionCode" mode="M8" priority="1002">
    <svrl:fired-rule context="cac:CatalogueLine/cbc:ActionCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="contains('�Add�Delete�Update�',concat('�',normalize-space(.),'�'))" />
      <xsl:otherwise>
        <svrl:failed-assert test="contains('�Add�Delete�Update�',concat('�',normalize-space(.),'�'))">
          <xsl:attribute name="id">CL-T19-R001</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[CL-T19-R001]-The action code for a catalogue line MUST be Add, Update or Delete if present</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M8" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="@mimeCode" mode="M8" priority="1001">
    <svrl:fired-rule context="@mimeCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="contains('�application/CSTAdata+xml�application/EDI-Consent�application/EDI-X12�application/EDIFACT�application/H224�application/activemessage�application/andrew-inset�application/applefile�application/atom+xml�application/atomcat+xml�application/atomicmail�application/atomsvc+xml�application/auth-policy+xml�application/batch-SMTP�application/beep+xml�application/cals-1840�application/ccxml+xml�application/cellml+xml�application/cnrp+xml�application/commonground�application/conference-info+xml�application/cpl+xml�application/csta+xml�application/cybercash�application/davmount+xml�application/dca-rft�application/dec-dx�application/dialog-info+xml�application/dicom�application/dns�application/dvcs�application/ecmascript�application/epp+xml�application/eshop�application/example�application/fastinfoset�application/fastsoap�application/fits�application/font-tdpfr�application/http�application/hyperstudio�application/iges�application/im-iscomposing+xml�application/index�application/index.cmd�application/index.obj�application/index.response�application/index.vnd�application/iotp�application/ipp�application/isup�application/javascript�application/json�application/kpml-request+xml�application/kpml-response+xml�application/mac-binhex40�application/macwriteii�application/marc�application/mathematica�application/mbms-associated-procedure-description+xml�application/mbms-deregister+xml�application/mbms-envelope+xml�application/mbms-msk+xml�application/mbms-msk-response+xml�application/mbms-protection-description+xml�application/mbms-reception-report+xml�application/mbms-register+xml�application/mbms-register-response+xml�application/mbms-user-service-description+xml�application/mbox�application/media_control+xml�application/mediaservercontrol+xml�application/mikey�application/moss-keys�application/moss-signature�application/mosskey-data�application/mosskey-request�application/mp4�application/mpeg4-generic�application/mpeg4-iod�application/mpeg4-iod-xmt�application/msword�application/mxf�application/nasdata�application/news-message-id�application/news-transmission�application/nss�application/ocsp-request�application/ocsp-response�application/octet-stream�application/oda�application/oebps-package+xml�application/ogg�application/parityfec�application/pdf�application/pgp-encrypted�application/pgp-keys�application/pgp-signature�application/pidf+xml�application/pkcs10�application/pkcs7-mime�application/pkcs7-signature�application/pkix-cert�application/pkix-crl�application/pkix-pkipath�application/pkixcmp�application/pls+xml�application/poc-settings+xml�application/postscript�application/prs.alvestrand.titrax-sheet�application/prs.cww�application/prs.nprend�application/prs.plucker�application/qsig�application/rdf+xml�application/reginfo+xml�application/relax-ng-compact-syntax�application/remote-printing�application/resource-lists+xml�application/riscos�application/rlmi+xml�application/rls-services+xml�application/rtf�application/rtx�application/samlassertion+xml�application/samlmetadata+xml�application/sbml+xml�application/scvp-cv-request�application/scvp-cv-response�application/scvp-vp-request�application/scvp-vp-response�application/sdp�application/set-payment�application/set-payment-initiation�application/set-registration�application/set-registration-initiation�application/sgml�application/sgml-open-catalog�application/shf+xml�application/sieve�application/simple-filter+xml�application/simple-message-summary�application/simpleSymbolContainer�application/slate�application/smil (OBSOLETE)�application/smil+xml�application/soap+fastinfoset�application/soap+xml�application/sparql-query�application/sparql-results+xml�application/spirits-event+xml�application/srgs�application/srgs+xml�application/ssml+xml�application/timestamp-query�application/timestamp-reply�application/tve-trigger�application/ulpfec�application/vemmi�application/vnd.3M.Post-it-Notes�application/vnd.3gpp.bsf+xml�application/vnd.3gpp.pic-bw-large�application/vnd.3gpp.pic-bw-small�application/vnd.3gpp.pic-bw-var�application/vnd.3gpp.sms�application/vnd.3gpp2.bcmcsinfo+xml�application/vnd.3gpp2.sms�application/vnd.3gpp2.tcap�application/vnd.FloGraphIt�application/vnd.HandHeld-Entertainment+xml�application/vnd.Kinar�application/vnd.MFER�application/vnd.Mobius.DAF�application/vnd.Mobius.DIS�application/vnd.Mobius.MBK�application/vnd.Mobius.MQY�application/vnd.Mobius.MSL�application/vnd.Mobius.PLC�application/vnd.Mobius.TXF�application/vnd.Quark.QuarkXPress�application/vnd.RenLearn.rlprint�application/vnd.SimTech-MindMapper�application/vnd.accpac.simply.aso�application/vnd.accpac.simply.imp�application/vnd.acucobol�application/vnd.acucorp�application/vnd.adobe.xdp+xml�application/vnd.adobe.xfdf�application/vnd.aether.imp�application/vnd.americandynamics.acc�application/vnd.amiga.ami�application/vnd.anser-web-certificate-issue-initiation�application/vnd.antix.game-component�application/vnd.apple.installer+xml�application/vnd.audiograph�application/vnd.autopackage�application/vnd.avistar+xml�application/vnd.blueice.multipass�application/vnd.bmi�application/vnd.businessobjects�application/vnd.cab-jscript�application/vnd.canon-cpdl�application/vnd.canon-lips�application/vnd.cendio.thinlinc.clientconf�application/vnd.chemdraw+xml�application/vnd.chipnuts.karaoke-mmd�application/vnd.cinderella�application/vnd.cirpack.isdn-ext�application/vnd.claymore�application/vnd.clonk.c4group�application/vnd.commerce-battelle�application/vnd.commonspace�application/vnd.contact.cmsg�application/vnd.cosmocaller�application/vnd.crick.clicker�application/vnd.crick.clicker.keyboard�application/vnd.crick.clicker.palette�application/vnd.crick.clicker.template�application/vnd.crick.clicker.wordbank�application/vnd.criticaltools.wbs+xml�application/vnd.ctc-posml�application/vnd.ctct.ws+xml�application/vnd.cups-pdf�application/vnd.cups-postscript�application/vnd.cups-ppd�application/vnd.cups-raster�application/vnd.cups-raw�application/vnd.curl�application/vnd.cybank�application/vnd.data-vision.rdz�application/vnd.denovo.fcselayout-link�application/vnd.dna�application/vnd.dpgraph�application/vnd.dreamfactory�application/vnd.dvb.esgcontainer�application/vnd.dvb.ipdcesgaccess�application/vnd.dxr�application/vnd.ecdis-update�application/vnd.ecowin.chart�application/vnd.ecowin.filerequest�application/vnd.ecowin.fileupdate�application/vnd.ecowin.series�application/vnd.ecowin.seriesrequest�application/vnd.ecowin.seriesupdate�application/vnd.enliven�application/vnd.epson.esf�application/vnd.epson.msf�application/vnd.epson.quickanime�application/vnd.epson.salt�application/vnd.epson.ssf�application/vnd.ericsson.quickcall�application/vnd.eszigno3+xml�application/vnd.eudora.data�application/vnd.ezpix-album�application/vnd.ezpix-package�application/vnd.fdf�application/vnd.ffsns�application/vnd.fints�application/vnd.fluxtime.clip�application/vnd.framemaker�application/vnd.frogans.fnc�application/vnd.frogans.ltf�application/vnd.fsc.weblaunch�application/vnd.fujitsu.oasys�application/vnd.fujitsu.oasys2�application/vnd.fujitsu.oasys3�application/vnd.fujitsu.oasysgp�application/vnd.fujitsu.oasysprs�application/vnd.fujixerox.ART-EX�application/vnd.fujixerox.ART4�application/vnd.fujixerox.HBPL�application/vnd.fujixerox.ddd�application/vnd.fujixerox.docuworks�application/vnd.fujixerox.docuworks.binder�application/vnd.fut-misnet�application/vnd.fuzzysheet�application/vnd.genomatix.tuxedo�application/vnd.google-earth.kml+xml�application/vnd.google-earth.kmz�application/vnd.grafeq�application/vnd.gridmp�application/vnd.groove-account�application/vnd.groove-help�application/vnd.groove-identity-message�application/vnd.groove-injector�application/vnd.groove-tool-message�application/vnd.groove-tool-template�application/vnd.groove-vcard�application/vnd.hbci�application/vnd.hcl-bireports�application/vnd.hhe.lesson-player�application/vnd.hp-HPGL�application/vnd.hp-PCL�application/vnd.hp-PCLXL�application/vnd.hp-hpid�application/vnd.hp-hps�application/vnd.hp-jlyt�application/vnd.httphone�application/vnd.hzn-3d-crossword�application/vnd.ibm.MiniPay�application/vnd.ibm.afplinedata�application/vnd.ibm.electronic-media�application/vnd.ibm.modcap�application/vnd.ibm.rights-management�application/vnd.ibm.secure-container�application/vnd.iccprofile�application/vnd.igloader�application/vnd.immervision-ivp�application/vnd.immervision-ivu�application/vnd.informedcontrol.rms+xml�application/vnd.informix-visionary�application/vnd.intercon.formnet�application/vnd.intertrust.digibox�application/vnd.intertrust.nncp�application/vnd.intu.qbo�application/vnd.intu.qfx�application/vnd.ipunplugged.rcprofile�application/vnd.irepository.package+xml�application/vnd.is-xpr�application/vnd.jam�application/vnd.japannet-directory-service�application/vnd.japannet-jpnstore-wakeup�application/vnd.japannet-payment-wakeup�application/vnd.japannet-registration�application/vnd.japannet-registration-wakeup�application/vnd.japannet-setstore-wakeup�application/vnd.japannet-verification�application/vnd.japannet-verification-wakeup�application/vnd.jcp.javame.midlet-rms�application/vnd.jisp�application/vnd.joost.joda-archive�application/vnd.kahootz�application/vnd.kde.karbon�application/vnd.kde.kchart�application/vnd.kde.kformula�application/vnd.kde.kivio�application/vnd.kde.kontour�application/vnd.kde.kpresenter�application/vnd.kde.kspread�application/vnd.kde.kword�application/vnd.kenameaapp�application/vnd.kidspiration�application/vnd.koan�application/vnd.kodak-descriptor�application/vnd.liberty-request+xml�application/vnd.llamagraphics.life-balance.desktop�application/vnd.llamagraphics.life-balance.exchange+xml�application/vnd.lotus-1-2-3�application/vnd.lotus-approach�application/vnd.lotus-freelance�application/vnd.lotus-notes�application/vnd.lotus-organizer�application/vnd.lotus-screencam�application/vnd.lotus-wordpro�application/vnd.macports.portpkg�application/vnd.marlin.drm.actiontoken+xml�application/vnd.marlin.drm.conftoken+xml�application/vnd.marlin.drm.mdcf�application/vnd.mcd�application/vnd.medcalcdata�application/vnd.mediastation.cdkey�application/vnd.meridian-slingshot�application/vnd.mfmp�application/vnd.micrografx.flo�application/vnd.micrografx.igx�application/vnd.mif�application/vnd.minisoft-hp3000-save�application/vnd.mitsubishi.misty-guard.trustweb�application/vnd.mophun.application�application/vnd.mophun.certificate�application/vnd.motorola.flexsuite�application/vnd.motorola.flexsuite.adsi�application/vnd.motorola.flexsuite.fis�application/vnd.motorola.flexsuite.gotap�application/vnd.motorola.flexsuite.kmr�application/vnd.motorola.flexsuite.ttc�application/vnd.motorola.flexsuite.wem�application/vnd.mozilla.xul+xml�application/vnd.ms-artgalry�application/vnd.ms-asf�application/vnd.ms-cab-compressed�application/vnd.ms-excel�application/vnd.ms-fontobject�application/vnd.ms-htmlhelp�application/vnd.ms-ims�application/vnd.ms-lrm�application/vnd.ms-playready.initiator+xml�application/vnd.ms-powerpoint�application/vnd.ms-project�application/vnd.ms-tnef�application/vnd.ms-wmdrm.lic-chlg-req�application/vnd.ms-wmdrm.lic-resp�application/vnd.ms-wmdrm.meter-chlg-req�application/vnd.ms-wmdrm.meter-resp�application/vnd.ms-works�application/vnd.ms-wpl�application/vnd.ms-xpsdocument�application/vnd.mseq�application/vnd.msign�application/vnd.multiad.creator�application/vnd.multiad.creator.cif�application/vnd.music-niff�application/vnd.musician�application/vnd.muvee.style�application/vnd.ncd.control�application/vnd.ncd.reference�application/vnd.nervana�application/vnd.netfpx�application/vnd.neurolanguage.nlu�application/vnd.noblenet-directory�application/vnd.noblenet-sealer�application/vnd.noblenet-web�application/vnd.nokia.catalogs�application/vnd.nokia.conml+wbxml�application/vnd.nokia.conml+xml�application/vnd.nokia.iSDS-radio-presets�application/vnd.nokia.iptv.config+xml�application/vnd.nokia.landmark+wbxml�application/vnd.nokia.landmark+xml�application/vnd.nokia.landmarkcollection+xml�application/vnd.nokia.n-gage.ac+xml�application/vnd.nokia.n-gage.data�application/vnd.nokia.n-gage.symbian.install�application/vnd.nokia.ncd�application/vnd.nokia.pcd+wbxml�application/vnd.nokia.pcd+xml�application/vnd.nokia.radio-preset�application/vnd.nokia.radio-presets�application/vnd.novadigm.EDM�application/vnd.novadigm.EDX�application/vnd.novadigm.EXT�application/vnd.oasis.opendocument.chart�application/vnd.oasis.opendocument.chart-template�application/vnd.oasis.opendocument.formula�application/vnd.oasis.opendocument.formula-template�application/vnd.oasis.opendocument.graphics�application/vnd.oasis.opendocument.graphics-template�application/vnd.oasis.opendocument.image�application/vnd.oasis.opendocument.image-template�application/vnd.oasis.opendocument.presentation�application/vnd.oasis.opendocument.presentation-template�application/vnd.oasis.opendocument.spreadsheet�application/vnd.oasis.opendocument.spreadsheet-template�application/vnd.oasis.opendocument.text�application/vnd.oasis.opendocument.text-master�application/vnd.oasis.opendocument.text-template�application/vnd.oasis.opendocument.text-web�application/vnd.obn�application/vnd.olpc-sugar�application/vnd.oma-scws-config�application/vnd.oma-scws-http-request�application/vnd.oma-scws-http-response�application/vnd.oma.bcast.associated-procedure-parameter+xml�application/vnd.oma.bcast.drm-trigger+xml�application/vnd.oma.bcast.imd+xml�application/vnd.oma.bcast.ltkm�application/vnd.oma.bcast.notification+xml�application/vnd.oma.bcast.sgboot�application/vnd.oma.bcast.sgdd+xml�application/vnd.oma.bcast.sgdu�application/vnd.oma.bcast.simple-symbol-container�application/vnd.oma.bcast.smartcard-trigger+xml�application/vnd.oma.bcast.sprov+xml�application/vnd.oma.bcast.stkm�application/vnd.oma.dd2+xml�application/vnd.oma.drm.risd+xml�application/vnd.oma.group-usage-list+xml�application/vnd.oma.poc.detailed-progress-report+xml�application/vnd.oma.poc.final-report+xml�application/vnd.oma.poc.groups+xml�application/vnd.oma.poc.invocation-descriptor+xml�application/vnd.oma.poc.optimized-progress-report+xml�application/vnd.oma.xcap-directory+xml�application/vnd.omads-email+xml�application/vnd.omads-file+xml�application/vnd.omads-folder+xml�application/vnd.omaloc-supl-init�application/vnd.openofficeorg.extension�application/vnd.osa.netdeploy�application/vnd.osgi.bundle�application/vnd.osgi.dp�application/vnd.otps.ct-kip+xml�application/vnd.palm�application/vnd.paos.xml�application/vnd.pg.format�application/vnd.pg.osasli�application/vnd.piaccess.application-licence�application/vnd.picsel�application/vnd.poc.group-advertisement+xml�application/vnd.pocketlearn�application/vnd.powerbuilder6�application/vnd.powerbuilder6-s�application/vnd.powerbuilder7�application/vnd.powerbuilder7-s�application/vnd.powerbuilder75�application/vnd.powerbuilder75-s�application/vnd.preminet�application/vnd.previewsystems.box�application/vnd.proteus.magazine�application/vnd.publishare-delta-tree�application/vnd.pvi.ptid1�application/vnd.pwg-multiplexed�application/vnd.pwg-xhtml-print+xml�application/vnd.qualcomm.brew-app-res�application/vnd.rapid�application/vnd.recordare.musicxml�application/vnd.recordare.musicxml+xml�application/vnd.ruckus.download�application/vnd.s3sms�application/vnd.sbm.mid2�application/vnd.scribus�application/vnd.sealed.3df�application/vnd.sealed.csf�application/vnd.sealed.doc�application/vnd.sealed.eml�application/vnd.sealed.mht�application/vnd.sealed.net�application/vnd.sealed.ppt�application/vnd.sealed.tiff�application/vnd.sealed.xls�application/vnd.sealedmedia.softseal.html�application/vnd.sealedmedia.softseal.pdf�application/vnd.seemail�application/vnd.sema�application/vnd.semd�application/vnd.semf�application/vnd.shana.informed.formdata�application/vnd.shana.informed.formtemplate�application/vnd.shana.informed.interchange�application/vnd.shana.informed.package�application/vnd.smaf�application/vnd.solent.sdkm+xml�application/vnd.spotfire.dxp�application/vnd.spotfire.sfs�application/vnd.sss-cod�application/vnd.sss-dtf�application/vnd.sss-ntf�application/vnd.street-stream�application/vnd.sun.wadl+xml�application/vnd.sus-calendar�application/vnd.svd�application/vnd.swiftview-ics�application/vnd.syncml+xml�application/vnd.syncml.dm+wbxml�application/vnd.syncml.dm+xml�application/vnd.syncml.ds.notification�application/vnd.tao.intent-module-archive�application/vnd.tmobile-livetv�application/vnd.trid.tpt�application/vnd.triscape.mxs�application/vnd.trueapp�application/vnd.truedoc�application/vnd.ufdl�application/vnd.uiq.theme�application/vnd.umajin�application/vnd.unity�application/vnd.uoml+xml�application/vnd.uplanet.alert�application/vnd.uplanet.alert-wbxml�application/vnd.uplanet.bearer-choice�application/vnd.uplanet.bearer-choice-wbxml�application/vnd.uplanet.cacheop�application/vnd.uplanet.cacheop-wbxml�application/vnd.uplanet.channel�application/vnd.uplanet.channel-wbxml�application/vnd.uplanet.list�application/vnd.uplanet.list-wbxml�application/vnd.uplanet.listcmd�application/vnd.uplanet.listcmd-wbxml�application/vnd.uplanet.signal�application/vnd.vcx�application/vnd.vd-study�application/vnd.vectorworks�application/vnd.vidsoft.vidconference�application/vnd.visio�application/vnd.visionary�application/vnd.vividence.scriptfile�application/vnd.vsf�application/vnd.wap.sic�application/vnd.wap.slc�application/vnd.wap.wbxml�application/vnd.wap.wmlc�application/vnd.wap.wmlscriptc�application/vnd.webturbo�application/vnd.wfa.wsc�application/vnd.wmc�application/vnd.wmf.bootstrap�application/vnd.wordperfect�application/vnd.wqd�application/vnd.wrq-hp3000-labelled�application/vnd.wt.stf�application/vnd.wv.csp+wbxml�application/vnd.wv.csp+xml�application/vnd.wv.ssp+xml�application/vnd.xara�application/vnd.xfdl�application/vnd.xmpie.cpkg�application/vnd.xmpie.dpkg�application/vnd.xmpie.plan�application/vnd.xmpie.ppkg�application/vnd.xmpie.xlim�application/vnd.yamaha.hv-dic�application/vnd.yamaha.hv-script�application/vnd.yamaha.hv-voice�application/vnd.yamaha.smaf-audio�application/vnd.yamaha.smaf-phrase�application/vnd.yellowriver-custom-menu�application/vnd.zzazz.deck+xml�application/voicexml+xml�application/watcherinfo+xml�application/whoispp-query�application/whoispp-response�application/wita�application/wordperfect5.1�application/wsdl+xml�application/wspolicy+xml�application/x400-bp�application/xcap-att+xml�application/xcap-caps+xml�application/xcap-el+xml�application/xcap-error+xml�application/xcap-ns+xml�application/xenc+xml�application/xhtml+xml�application/xhtml-voice+xml (Obsolete)�application/xml�application/xml-dtd�application/xml-external-parsed-entity�application/xmpp+xml�application/xop+xml�application/xv+xml�application/zip�audio/32kadpcm�audio/3gpp�audio/3gpp2�audio/AMR�audio/AMR-WB�audio/BV16�audio/BV32�audio/CN�audio/DAT12�audio/DVI4�audio/EVRC�audio/EVRC-QCP�audio/EVRC0�audio/EVRC1�audio/EVRCB�audio/EVRCB0�audio/EVRCB1�audio/EVRCWB�audio/EVRCWB0�audio/EVRCWB1�audio/G722�audio/G7221�audio/G723�audio/G726-16�audio/G726-24�audio/G726-32�audio/G726-40�audio/G728�audio/G729�audio/G7291�audio/G729D�audio/G729E�audio/GSM�audio/GSM-EFR�audio/L16�audio/L20�audio/L24�audio/L8�audio/LPC�audio/MP4A-LATM�audio/MPA�audio/PCMA�audio/PCMU�audio/QCELP�audio/RED�audio/SMV�audio/SMV-QCP�audio/SMV0�audio/VDVI�audio/VMR-WB�audio/ac3�audio/amr-wb+�audio/asc�audio/basic�audio/clearmode�audio/dls�audio/dsr-es201108�audio/dsr-es202050�audio/dsr-es202211�audio/dsr-es202212�audio/eac3�audio/example�audio/iLBC�audio/mobile-xmf�audio/mp4�audio/mpa-robust�audio/mpeg�audio/mpeg4-generic�audio/parityfec�audio/prs.sid�audio/rRFC2045tp-midi�audio/rtp-enc-aescm128�audio/rtx�audio/sp-midi�audio/t140c�audio/t38�audio/telephone-event�audio/tone�audio/ulpfec�audio/vnd.3gpp.iufp�audio/vnd.4SB�audio/vnd.CELP�audio/vnd.audiokoz�audio/vnd.cisco.nse�audio/vnd.cmles.radio-events�audio/vnd.cns.anp1�audio/vnd.cns.inf1�audio/vnd.digital-winds�audio/vnd.dlna.adts�audio/vnd.dolby.mlp�audio/vnd.everad.plj�audio/vnd.hns.audio�audio/vnd.lucent.voice�audio/vnd.nokia.mobile-xmf�audio/vnd.nortel.vbk�audio/vnd.nuera.ecelp4800�audio/vnd.nuera.ecelp7470�audio/vnd.nuera.ecelp9600�audio/vnd.octel.sbc�audio/vnd.qcelp - DEPRECATED - Please use audio/qcelp�audio/vnd.rhetorex.32kadpcm�audio/vnd.sealedmedia.softseal.mpeg�audio/vnd.vmx.cvsd�image/cgm�image/example�image/fits�image/g3fax�image/gif�image/ief�image/jp2�image/jpeg�image/jpm�image/jpx�image/naplps�image/png�image/prs.btif�image/prs.pti�image/t38�image/tiff�image/tiff-fx�image/vnd.adobe.photoshop�image/vnd.cns.inf2�image/vnd.djvu�image/vnd.dwg�image/vnd.dxf�image/vnd.fastbidsheet�image/vnd.fpx�image/vnd.fst�image/vnd.fujixerox.edmics-mmr�image/vnd.fujixerox.edmics-rlc�image/vnd.globalgraphics.pgb�image/vnd.microsoft.icon�image/vnd.mix�image/vnd.ms-modi�image/vnd.net-fpx�image/vnd.sealed.png�image/vnd.sealedmedia.softseal.gif�image/vnd.sealedmedia.softseal.jpg�image/vnd.svf�image/vnd.wap.wbmp�image/vnd.xiff�message/CPIM�message/delivery-status�message/disposition-notification�message/example�message/external-body�message/http�message/news�message/partial�message/rfc822�message/s-http�message/sip�message/sipfrag�message/tracking-status�message/vnd.si.simp�model/example�model/iges�model/mesh�model/vnd.dwf�model/vnd.flatland.3dml�model/vnd.gdl�model/vnd.gs-gdl�model/vnd.gtw�model/vnd.moml+xml�model/vnd.mts�model/vnd.parasolid.transmit.binary�model/vnd.parasolid.transmit.text�model/vnd.vtu�model/vrml�multipart/alternative�multipart/appledouble�multipart/byteranges�multipart/digest�multipart/encrypted�multipart/example�multipart/form-data�multipart/header-set�multipart/mixed�multipart/parallel�multipart/related�multipart/report�multipart/signed�multipart/voice-message�text/RED�text/calendar�text/css�text/csv�text/directory�text/dns�text/ecmascript (obsolete)�text/enriched�text/example�text/html�text/javascript (obsolete)�text/parityfec�text/plain�text/prs.fallenstein.rst�text/prs.lines.tag�text/rfc822-headers�text/richtext�text/rtf�text/rtp-enc-aescm128�text/rtx�text/sgml�text/t140�text/tab-separated-values�text/troff�text/ulpfec�text/uri-list�text/vnd.DMClientScript�text/vnd.IPTC.NITF�text/vnd.IPTC.NewsML�text/vnd.abc�text/vnd.curl�text/vnd.esmertec.theme-descriptor�text/vnd.fly�text/vnd.fmi.flexstor�text/vnd.in3d.3dml�text/vnd.in3d.spot�text/vnd.latex-z�text/vnd.motorola.reflex�text/vnd.ms-mediapackage�text/vnd.net2phone.commcenter.command�text/vnd.si.uricatalogue�text/vnd.sun.j2me.app-descriptor�text/vnd.trolltech.linguist�text/vnd.wap.si�text/vnd.wap.sl�text/vnd.wap.wml�text/vnd.wap.wmlscript�text/xml�text/xml-external-parsed-entity�video/3gpp�video/3gpp-tt�video/3gpp2�video/BMPEG�video/BT656�video/CelB�video/DV�video/H261�video/H263�video/H263-1998�video/H263-2000�video/H264�video/JPEG�video/MJ2�video/MP1S�video/MP2P�video/MP2T�video/MP4V-ES�video/MPV�video/SMPTE292M�video/example�video/mp4�video/mpeg�video/mpeg4-generic�video/nv�video/parityfec�video/pointer�video/quicktime�video/raw�video/rtp-enc-aescm128�video/rtx�video/ulpfec�video/vc1�video/vnd.dlna.mpeg-tts�video/vnd.fvt�video/vnd.hns.video�video/vnd.iptvforum.1dparityfec-1010�video/vnd.iptvforum.1dparityfec-2005�video/vnd.iptvforum.2dparityfec-1010�video/vnd.iptvforum.2dparityfec-2005�video/vnd.iptvforum.ttsavc�video/vnd.iptvforum.ttsmpeg2�video/vnd.motorola.video�video/vnd.motorola.videop�video/vnd.mpegurl�video/vnd.nokia.interleaved-multimedia�video/vnd.nokia.videovoip�video/vnd.objectvideo�video/vnd.sealed.mpeg1�video/vnd.sealed.mpeg4�video/vnd.sealed.swf�video/vnd.sealedmedia.softseal.mov�video/vnd.vivo�',concat('�',normalize-space(.),'�'))" />
      <xsl:otherwise>
        <svrl:failed-assert test="contains('�application/CSTAdata+xml�application/EDI-Consent�application/EDI-X12�application/EDIFACT�application/H224�application/activemessage�application/andrew-inset�application/applefile�application/atom+xml�application/atomcat+xml�application/atomicmail�application/atomsvc+xml�application/auth-policy+xml�application/batch-SMTP�application/beep+xml�application/cals-1840�application/ccxml+xml�application/cellml+xml�application/cnrp+xml�application/commonground�application/conference-info+xml�application/cpl+xml�application/csta+xml�application/cybercash�application/davmount+xml�application/dca-rft�application/dec-dx�application/dialog-info+xml�application/dicom�application/dns�application/dvcs�application/ecmascript�application/epp+xml�application/eshop�application/example�application/fastinfoset�application/fastsoap�application/fits�application/font-tdpfr�application/http�application/hyperstudio�application/iges�application/im-iscomposing+xml�application/index�application/index.cmd�application/index.obj�application/index.response�application/index.vnd�application/iotp�application/ipp�application/isup�application/javascript�application/json�application/kpml-request+xml�application/kpml-response+xml�application/mac-binhex40�application/macwriteii�application/marc�application/mathematica�application/mbms-associated-procedure-description+xml�application/mbms-deregister+xml�application/mbms-envelope+xml�application/mbms-msk+xml�application/mbms-msk-response+xml�application/mbms-protection-description+xml�application/mbms-reception-report+xml�application/mbms-register+xml�application/mbms-register-response+xml�application/mbms-user-service-description+xml�application/mbox�application/media_control+xml�application/mediaservercontrol+xml�application/mikey�application/moss-keys�application/moss-signature�application/mosskey-data�application/mosskey-request�application/mp4�application/mpeg4-generic�application/mpeg4-iod�application/mpeg4-iod-xmt�application/msword�application/mxf�application/nasdata�application/news-message-id�application/news-transmission�application/nss�application/ocsp-request�application/ocsp-response�application/octet-stream�application/oda�application/oebps-package+xml�application/ogg�application/parityfec�application/pdf�application/pgp-encrypted�application/pgp-keys�application/pgp-signature�application/pidf+xml�application/pkcs10�application/pkcs7-mime�application/pkcs7-signature�application/pkix-cert�application/pkix-crl�application/pkix-pkipath�application/pkixcmp�application/pls+xml�application/poc-settings+xml�application/postscript�application/prs.alvestrand.titrax-sheet�application/prs.cww�application/prs.nprend�application/prs.plucker�application/qsig�application/rdf+xml�application/reginfo+xml�application/relax-ng-compact-syntax�application/remote-printing�application/resource-lists+xml�application/riscos�application/rlmi+xml�application/rls-services+xml�application/rtf�application/rtx�application/samlassertion+xml�application/samlmetadata+xml�application/sbml+xml�application/scvp-cv-request�application/scvp-cv-response�application/scvp-vp-request�application/scvp-vp-response�application/sdp�application/set-payment�application/set-payment-initiation�application/set-registration�application/set-registration-initiation�application/sgml�application/sgml-open-catalog�application/shf+xml�application/sieve�application/simple-filter+xml�application/simple-message-summary�application/simpleSymbolContainer�application/slate�application/smil (OBSOLETE)�application/smil+xml�application/soap+fastinfoset�application/soap+xml�application/sparql-query�application/sparql-results+xml�application/spirits-event+xml�application/srgs�application/srgs+xml�application/ssml+xml�application/timestamp-query�application/timestamp-reply�application/tve-trigger�application/ulpfec�application/vemmi�application/vnd.3M.Post-it-Notes�application/vnd.3gpp.bsf+xml�application/vnd.3gpp.pic-bw-large�application/vnd.3gpp.pic-bw-small�application/vnd.3gpp.pic-bw-var�application/vnd.3gpp.sms�application/vnd.3gpp2.bcmcsinfo+xml�application/vnd.3gpp2.sms�application/vnd.3gpp2.tcap�application/vnd.FloGraphIt�application/vnd.HandHeld-Entertainment+xml�application/vnd.Kinar�application/vnd.MFER�application/vnd.Mobius.DAF�application/vnd.Mobius.DIS�application/vnd.Mobius.MBK�application/vnd.Mobius.MQY�application/vnd.Mobius.MSL�application/vnd.Mobius.PLC�application/vnd.Mobius.TXF�application/vnd.Quark.QuarkXPress�application/vnd.RenLearn.rlprint�application/vnd.SimTech-MindMapper�application/vnd.accpac.simply.aso�application/vnd.accpac.simply.imp�application/vnd.acucobol�application/vnd.acucorp�application/vnd.adobe.xdp+xml�application/vnd.adobe.xfdf�application/vnd.aether.imp�application/vnd.americandynamics.acc�application/vnd.amiga.ami�application/vnd.anser-web-certificate-issue-initiation�application/vnd.antix.game-component�application/vnd.apple.installer+xml�application/vnd.audiograph�application/vnd.autopackage�application/vnd.avistar+xml�application/vnd.blueice.multipass�application/vnd.bmi�application/vnd.businessobjects�application/vnd.cab-jscript�application/vnd.canon-cpdl�application/vnd.canon-lips�application/vnd.cendio.thinlinc.clientconf�application/vnd.chemdraw+xml�application/vnd.chipnuts.karaoke-mmd�application/vnd.cinderella�application/vnd.cirpack.isdn-ext�application/vnd.claymore�application/vnd.clonk.c4group�application/vnd.commerce-battelle�application/vnd.commonspace�application/vnd.contact.cmsg�application/vnd.cosmocaller�application/vnd.crick.clicker�application/vnd.crick.clicker.keyboard�application/vnd.crick.clicker.palette�application/vnd.crick.clicker.template�application/vnd.crick.clicker.wordbank�application/vnd.criticaltools.wbs+xml�application/vnd.ctc-posml�application/vnd.ctct.ws+xml�application/vnd.cups-pdf�application/vnd.cups-postscript�application/vnd.cups-ppd�application/vnd.cups-raster�application/vnd.cups-raw�application/vnd.curl�application/vnd.cybank�application/vnd.data-vision.rdz�application/vnd.denovo.fcselayout-link�application/vnd.dna�application/vnd.dpgraph�application/vnd.dreamfactory�application/vnd.dvb.esgcontainer�application/vnd.dvb.ipdcesgaccess�application/vnd.dxr�application/vnd.ecdis-update�application/vnd.ecowin.chart�application/vnd.ecowin.filerequest�application/vnd.ecowin.fileupdate�application/vnd.ecowin.series�application/vnd.ecowin.seriesrequest�application/vnd.ecowin.seriesupdate�application/vnd.enliven�application/vnd.epson.esf�application/vnd.epson.msf�application/vnd.epson.quickanime�application/vnd.epson.salt�application/vnd.epson.ssf�application/vnd.ericsson.quickcall�application/vnd.eszigno3+xml�application/vnd.eudora.data�application/vnd.ezpix-album�application/vnd.ezpix-package�application/vnd.fdf�application/vnd.ffsns�application/vnd.fints�application/vnd.fluxtime.clip�application/vnd.framemaker�application/vnd.frogans.fnc�application/vnd.frogans.ltf�application/vnd.fsc.weblaunch�application/vnd.fujitsu.oasys�application/vnd.fujitsu.oasys2�application/vnd.fujitsu.oasys3�application/vnd.fujitsu.oasysgp�application/vnd.fujitsu.oasysprs�application/vnd.fujixerox.ART-EX�application/vnd.fujixerox.ART4�application/vnd.fujixerox.HBPL�application/vnd.fujixerox.ddd�application/vnd.fujixerox.docuworks�application/vnd.fujixerox.docuworks.binder�application/vnd.fut-misnet�application/vnd.fuzzysheet�application/vnd.genomatix.tuxedo�application/vnd.google-earth.kml+xml�application/vnd.google-earth.kmz�application/vnd.grafeq�application/vnd.gridmp�application/vnd.groove-account�application/vnd.groove-help�application/vnd.groove-identity-message�application/vnd.groove-injector�application/vnd.groove-tool-message�application/vnd.groove-tool-template�application/vnd.groove-vcard�application/vnd.hbci�application/vnd.hcl-bireports�application/vnd.hhe.lesson-player�application/vnd.hp-HPGL�application/vnd.hp-PCL�application/vnd.hp-PCLXL�application/vnd.hp-hpid�application/vnd.hp-hps�application/vnd.hp-jlyt�application/vnd.httphone�application/vnd.hzn-3d-crossword�application/vnd.ibm.MiniPay�application/vnd.ibm.afplinedata�application/vnd.ibm.electronic-media�application/vnd.ibm.modcap�application/vnd.ibm.rights-management�application/vnd.ibm.secure-container�application/vnd.iccprofile�application/vnd.igloader�application/vnd.immervision-ivp�application/vnd.immervision-ivu�application/vnd.informedcontrol.rms+xml�application/vnd.informix-visionary�application/vnd.intercon.formnet�application/vnd.intertrust.digibox�application/vnd.intertrust.nncp�application/vnd.intu.qbo�application/vnd.intu.qfx�application/vnd.ipunplugged.rcprofile�application/vnd.irepository.package+xml�application/vnd.is-xpr�application/vnd.jam�application/vnd.japannet-directory-service�application/vnd.japannet-jpnstore-wakeup�application/vnd.japannet-payment-wakeup�application/vnd.japannet-registration�application/vnd.japannet-registration-wakeup�application/vnd.japannet-setstore-wakeup�application/vnd.japannet-verification�application/vnd.japannet-verification-wakeup�application/vnd.jcp.javame.midlet-rms�application/vnd.jisp�application/vnd.joost.joda-archive�application/vnd.kahootz�application/vnd.kde.karbon�application/vnd.kde.kchart�application/vnd.kde.kformula�application/vnd.kde.kivio�application/vnd.kde.kontour�application/vnd.kde.kpresenter�application/vnd.kde.kspread�application/vnd.kde.kword�application/vnd.kenameaapp�application/vnd.kidspiration�application/vnd.koan�application/vnd.kodak-descriptor�application/vnd.liberty-request+xml�application/vnd.llamagraphics.life-balance.desktop�application/vnd.llamagraphics.life-balance.exchange+xml�application/vnd.lotus-1-2-3�application/vnd.lotus-approach�application/vnd.lotus-freelance�application/vnd.lotus-notes�application/vnd.lotus-organizer�application/vnd.lotus-screencam�application/vnd.lotus-wordpro�application/vnd.macports.portpkg�application/vnd.marlin.drm.actiontoken+xml�application/vnd.marlin.drm.conftoken+xml�application/vnd.marlin.drm.mdcf�application/vnd.mcd�application/vnd.medcalcdata�application/vnd.mediastation.cdkey�application/vnd.meridian-slingshot�application/vnd.mfmp�application/vnd.micrografx.flo�application/vnd.micrografx.igx�application/vnd.mif�application/vnd.minisoft-hp3000-save�application/vnd.mitsubishi.misty-guard.trustweb�application/vnd.mophun.application�application/vnd.mophun.certificate�application/vnd.motorola.flexsuite�application/vnd.motorola.flexsuite.adsi�application/vnd.motorola.flexsuite.fis�application/vnd.motorola.flexsuite.gotap�application/vnd.motorola.flexsuite.kmr�application/vnd.motorola.flexsuite.ttc�application/vnd.motorola.flexsuite.wem�application/vnd.mozilla.xul+xml�application/vnd.ms-artgalry�application/vnd.ms-asf�application/vnd.ms-cab-compressed�application/vnd.ms-excel�application/vnd.ms-fontobject�application/vnd.ms-htmlhelp�application/vnd.ms-ims�application/vnd.ms-lrm�application/vnd.ms-playready.initiator+xml�application/vnd.ms-powerpoint�application/vnd.ms-project�application/vnd.ms-tnef�application/vnd.ms-wmdrm.lic-chlg-req�application/vnd.ms-wmdrm.lic-resp�application/vnd.ms-wmdrm.meter-chlg-req�application/vnd.ms-wmdrm.meter-resp�application/vnd.ms-works�application/vnd.ms-wpl�application/vnd.ms-xpsdocument�application/vnd.mseq�application/vnd.msign�application/vnd.multiad.creator�application/vnd.multiad.creator.cif�application/vnd.music-niff�application/vnd.musician�application/vnd.muvee.style�application/vnd.ncd.control�application/vnd.ncd.reference�application/vnd.nervana�application/vnd.netfpx�application/vnd.neurolanguage.nlu�application/vnd.noblenet-directory�application/vnd.noblenet-sealer�application/vnd.noblenet-web�application/vnd.nokia.catalogs�application/vnd.nokia.conml+wbxml�application/vnd.nokia.conml+xml�application/vnd.nokia.iSDS-radio-presets�application/vnd.nokia.iptv.config+xml�application/vnd.nokia.landmark+wbxml�application/vnd.nokia.landmark+xml�application/vnd.nokia.landmarkcollection+xml�application/vnd.nokia.n-gage.ac+xml�application/vnd.nokia.n-gage.data�application/vnd.nokia.n-gage.symbian.install�application/vnd.nokia.ncd�application/vnd.nokia.pcd+wbxml�application/vnd.nokia.pcd+xml�application/vnd.nokia.radio-preset�application/vnd.nokia.radio-presets�application/vnd.novadigm.EDM�application/vnd.novadigm.EDX�application/vnd.novadigm.EXT�application/vnd.oasis.opendocument.chart�application/vnd.oasis.opendocument.chart-template�application/vnd.oasis.opendocument.formula�application/vnd.oasis.opendocument.formula-template�application/vnd.oasis.opendocument.graphics�application/vnd.oasis.opendocument.graphics-template�application/vnd.oasis.opendocument.image�application/vnd.oasis.opendocument.image-template�application/vnd.oasis.opendocument.presentation�application/vnd.oasis.opendocument.presentation-template�application/vnd.oasis.opendocument.spreadsheet�application/vnd.oasis.opendocument.spreadsheet-template�application/vnd.oasis.opendocument.text�application/vnd.oasis.opendocument.text-master�application/vnd.oasis.opendocument.text-template�application/vnd.oasis.opendocument.text-web�application/vnd.obn�application/vnd.olpc-sugar�application/vnd.oma-scws-config�application/vnd.oma-scws-http-request�application/vnd.oma-scws-http-response�application/vnd.oma.bcast.associated-procedure-parameter+xml�application/vnd.oma.bcast.drm-trigger+xml�application/vnd.oma.bcast.imd+xml�application/vnd.oma.bcast.ltkm�application/vnd.oma.bcast.notification+xml�application/vnd.oma.bcast.sgboot�application/vnd.oma.bcast.sgdd+xml�application/vnd.oma.bcast.sgdu�application/vnd.oma.bcast.simple-symbol-container�application/vnd.oma.bcast.smartcard-trigger+xml�application/vnd.oma.bcast.sprov+xml�application/vnd.oma.bcast.stkm�application/vnd.oma.dd2+xml�application/vnd.oma.drm.risd+xml�application/vnd.oma.group-usage-list+xml�application/vnd.oma.poc.detailed-progress-report+xml�application/vnd.oma.poc.final-report+xml�application/vnd.oma.poc.groups+xml�application/vnd.oma.poc.invocation-descriptor+xml�application/vnd.oma.poc.optimized-progress-report+xml�application/vnd.oma.xcap-directory+xml�application/vnd.omads-email+xml�application/vnd.omads-file+xml�application/vnd.omads-folder+xml�application/vnd.omaloc-supl-init�application/vnd.openofficeorg.extension�application/vnd.osa.netdeploy�application/vnd.osgi.bundle�application/vnd.osgi.dp�application/vnd.otps.ct-kip+xml�application/vnd.palm�application/vnd.paos.xml�application/vnd.pg.format�application/vnd.pg.osasli�application/vnd.piaccess.application-licence�application/vnd.picsel�application/vnd.poc.group-advertisement+xml�application/vnd.pocketlearn�application/vnd.powerbuilder6�application/vnd.powerbuilder6-s�application/vnd.powerbuilder7�application/vnd.powerbuilder7-s�application/vnd.powerbuilder75�application/vnd.powerbuilder75-s�application/vnd.preminet�application/vnd.previewsystems.box�application/vnd.proteus.magazine�application/vnd.publishare-delta-tree�application/vnd.pvi.ptid1�application/vnd.pwg-multiplexed�application/vnd.pwg-xhtml-print+xml�application/vnd.qualcomm.brew-app-res�application/vnd.rapid�application/vnd.recordare.musicxml�application/vnd.recordare.musicxml+xml�application/vnd.ruckus.download�application/vnd.s3sms�application/vnd.sbm.mid2�application/vnd.scribus�application/vnd.sealed.3df�application/vnd.sealed.csf�application/vnd.sealed.doc�application/vnd.sealed.eml�application/vnd.sealed.mht�application/vnd.sealed.net�application/vnd.sealed.ppt�application/vnd.sealed.tiff�application/vnd.sealed.xls�application/vnd.sealedmedia.softseal.html�application/vnd.sealedmedia.softseal.pdf�application/vnd.seemail�application/vnd.sema�application/vnd.semd�application/vnd.semf�application/vnd.shana.informed.formdata�application/vnd.shana.informed.formtemplate�application/vnd.shana.informed.interchange�application/vnd.shana.informed.package�application/vnd.smaf�application/vnd.solent.sdkm+xml�application/vnd.spotfire.dxp�application/vnd.spotfire.sfs�application/vnd.sss-cod�application/vnd.sss-dtf�application/vnd.sss-ntf�application/vnd.street-stream�application/vnd.sun.wadl+xml�application/vnd.sus-calendar�application/vnd.svd�application/vnd.swiftview-ics�application/vnd.syncml+xml�application/vnd.syncml.dm+wbxml�application/vnd.syncml.dm+xml�application/vnd.syncml.ds.notification�application/vnd.tao.intent-module-archive�application/vnd.tmobile-livetv�application/vnd.trid.tpt�application/vnd.triscape.mxs�application/vnd.trueapp�application/vnd.truedoc�application/vnd.ufdl�application/vnd.uiq.theme�application/vnd.umajin�application/vnd.unity�application/vnd.uoml+xml�application/vnd.uplanet.alert�application/vnd.uplanet.alert-wbxml�application/vnd.uplanet.bearer-choice�application/vnd.uplanet.bearer-choice-wbxml�application/vnd.uplanet.cacheop�application/vnd.uplanet.cacheop-wbxml�application/vnd.uplanet.channel�application/vnd.uplanet.channel-wbxml�application/vnd.uplanet.list�application/vnd.uplanet.list-wbxml�application/vnd.uplanet.listcmd�application/vnd.uplanet.listcmd-wbxml�application/vnd.uplanet.signal�application/vnd.vcx�application/vnd.vd-study�application/vnd.vectorworks�application/vnd.vidsoft.vidconference�application/vnd.visio�application/vnd.visionary�application/vnd.vividence.scriptfile�application/vnd.vsf�application/vnd.wap.sic�application/vnd.wap.slc�application/vnd.wap.wbxml�application/vnd.wap.wmlc�application/vnd.wap.wmlscriptc�application/vnd.webturbo�application/vnd.wfa.wsc�application/vnd.wmc�application/vnd.wmf.bootstrap�application/vnd.wordperfect�application/vnd.wqd�application/vnd.wrq-hp3000-labelled�application/vnd.wt.stf�application/vnd.wv.csp+wbxml�application/vnd.wv.csp+xml�application/vnd.wv.ssp+xml�application/vnd.xara�application/vnd.xfdl�application/vnd.xmpie.cpkg�application/vnd.xmpie.dpkg�application/vnd.xmpie.plan�application/vnd.xmpie.ppkg�application/vnd.xmpie.xlim�application/vnd.yamaha.hv-dic�application/vnd.yamaha.hv-script�application/vnd.yamaha.hv-voice�application/vnd.yamaha.smaf-audio�application/vnd.yamaha.smaf-phrase�application/vnd.yellowriver-custom-menu�application/vnd.zzazz.deck+xml�application/voicexml+xml�application/watcherinfo+xml�application/whoispp-query�application/whoispp-response�application/wita�application/wordperfect5.1�application/wsdl+xml�application/wspolicy+xml�application/x400-bp�application/xcap-att+xml�application/xcap-caps+xml�application/xcap-el+xml�application/xcap-error+xml�application/xcap-ns+xml�application/xenc+xml�application/xhtml+xml�application/xhtml-voice+xml (Obsolete)�application/xml�application/xml-dtd�application/xml-external-parsed-entity�application/xmpp+xml�application/xop+xml�application/xv+xml�application/zip�audio/32kadpcm�audio/3gpp�audio/3gpp2�audio/AMR�audio/AMR-WB�audio/BV16�audio/BV32�audio/CN�audio/DAT12�audio/DVI4�audio/EVRC�audio/EVRC-QCP�audio/EVRC0�audio/EVRC1�audio/EVRCB�audio/EVRCB0�audio/EVRCB1�audio/EVRCWB�audio/EVRCWB0�audio/EVRCWB1�audio/G722�audio/G7221�audio/G723�audio/G726-16�audio/G726-24�audio/G726-32�audio/G726-40�audio/G728�audio/G729�audio/G7291�audio/G729D�audio/G729E�audio/GSM�audio/GSM-EFR�audio/L16�audio/L20�audio/L24�audio/L8�audio/LPC�audio/MP4A-LATM�audio/MPA�audio/PCMA�audio/PCMU�audio/QCELP�audio/RED�audio/SMV�audio/SMV-QCP�audio/SMV0�audio/VDVI�audio/VMR-WB�audio/ac3�audio/amr-wb+�audio/asc�audio/basic�audio/clearmode�audio/dls�audio/dsr-es201108�audio/dsr-es202050�audio/dsr-es202211�audio/dsr-es202212�audio/eac3�audio/example�audio/iLBC�audio/mobile-xmf�audio/mp4�audio/mpa-robust�audio/mpeg�audio/mpeg4-generic�audio/parityfec�audio/prs.sid�audio/rRFC2045tp-midi�audio/rtp-enc-aescm128�audio/rtx�audio/sp-midi�audio/t140c�audio/t38�audio/telephone-event�audio/tone�audio/ulpfec�audio/vnd.3gpp.iufp�audio/vnd.4SB�audio/vnd.CELP�audio/vnd.audiokoz�audio/vnd.cisco.nse�audio/vnd.cmles.radio-events�audio/vnd.cns.anp1�audio/vnd.cns.inf1�audio/vnd.digital-winds�audio/vnd.dlna.adts�audio/vnd.dolby.mlp�audio/vnd.everad.plj�audio/vnd.hns.audio�audio/vnd.lucent.voice�audio/vnd.nokia.mobile-xmf�audio/vnd.nortel.vbk�audio/vnd.nuera.ecelp4800�audio/vnd.nuera.ecelp7470�audio/vnd.nuera.ecelp9600�audio/vnd.octel.sbc�audio/vnd.qcelp - DEPRECATED - Please use audio/qcelp�audio/vnd.rhetorex.32kadpcm�audio/vnd.sealedmedia.softseal.mpeg�audio/vnd.vmx.cvsd�image/cgm�image/example�image/fits�image/g3fax�image/gif�image/ief�image/jp2�image/jpeg�image/jpm�image/jpx�image/naplps�image/png�image/prs.btif�image/prs.pti�image/t38�image/tiff�image/tiff-fx�image/vnd.adobe.photoshop�image/vnd.cns.inf2�image/vnd.djvu�image/vnd.dwg�image/vnd.dxf�image/vnd.fastbidsheet�image/vnd.fpx�image/vnd.fst�image/vnd.fujixerox.edmics-mmr�image/vnd.fujixerox.edmics-rlc�image/vnd.globalgraphics.pgb�image/vnd.microsoft.icon�image/vnd.mix�image/vnd.ms-modi�image/vnd.net-fpx�image/vnd.sealed.png�image/vnd.sealedmedia.softseal.gif�image/vnd.sealedmedia.softseal.jpg�image/vnd.svf�image/vnd.wap.wbmp�image/vnd.xiff�message/CPIM�message/delivery-status�message/disposition-notification�message/example�message/external-body�message/http�message/news�message/partial�message/rfc822�message/s-http�message/sip�message/sipfrag�message/tracking-status�message/vnd.si.simp�model/example�model/iges�model/mesh�model/vnd.dwf�model/vnd.flatland.3dml�model/vnd.gdl�model/vnd.gs-gdl�model/vnd.gtw�model/vnd.moml+xml�model/vnd.mts�model/vnd.parasolid.transmit.binary�model/vnd.parasolid.transmit.text�model/vnd.vtu�model/vrml�multipart/alternative�multipart/appledouble�multipart/byteranges�multipart/digest�multipart/encrypted�multipart/example�multipart/form-data�multipart/header-set�multipart/mixed�multipart/parallel�multipart/related�multipart/report�multipart/signed�multipart/voice-message�text/RED�text/calendar�text/css�text/csv�text/directory�text/dns�text/ecmascript (obsolete)�text/enriched�text/example�text/html�text/javascript (obsolete)�text/parityfec�text/plain�text/prs.fallenstein.rst�text/prs.lines.tag�text/rfc822-headers�text/richtext�text/rtf�text/rtp-enc-aescm128�text/rtx�text/sgml�text/t140�text/tab-separated-values�text/troff�text/ulpfec�text/uri-list�text/vnd.DMClientScript�text/vnd.IPTC.NITF�text/vnd.IPTC.NewsML�text/vnd.abc�text/vnd.curl�text/vnd.esmertec.theme-descriptor�text/vnd.fly�text/vnd.fmi.flexstor�text/vnd.in3d.3dml�text/vnd.in3d.spot�text/vnd.latex-z�text/vnd.motorola.reflex�text/vnd.ms-mediapackage�text/vnd.net2phone.commcenter.command�text/vnd.si.uricatalogue�text/vnd.sun.j2me.app-descriptor�text/vnd.trolltech.linguist�text/vnd.wap.si�text/vnd.wap.sl�text/vnd.wap.wml�text/vnd.wap.wmlscript�text/xml�text/xml-external-parsed-entity�video/3gpp�video/3gpp-tt�video/3gpp2�video/BMPEG�video/BT656�video/CelB�video/DV�video/H261�video/H263�video/H263-1998�video/H263-2000�video/H264�video/JPEG�video/MJ2�video/MP1S�video/MP2P�video/MP2T�video/MP4V-ES�video/MPV�video/SMPTE292M�video/example�video/mp4�video/mpeg�video/mpeg4-generic�video/nv�video/parityfec�video/pointer�video/quicktime�video/raw�video/rtp-enc-aescm128�video/rtx�video/ulpfec�video/vc1�video/vnd.dlna.mpeg-tts�video/vnd.fvt�video/vnd.hns.video�video/vnd.iptvforum.1dparityfec-1010�video/vnd.iptvforum.1dparityfec-2005�video/vnd.iptvforum.2dparityfec-1010�video/vnd.iptvforum.2dparityfec-2005�video/vnd.iptvforum.ttsavc�video/vnd.iptvforum.ttsmpeg2�video/vnd.motorola.video�video/vnd.motorola.videop�video/vnd.mpegurl�video/vnd.nokia.interleaved-multimedia�video/vnd.nokia.videovoip�video/vnd.objectvideo�video/vnd.sealed.mpeg1�video/vnd.sealed.mpeg4�video/vnd.sealed.swf�video/vnd.sealedmedia.softseal.mov�video/vnd.vivo�',concat('�',normalize-space(.),'�'))">
          <xsl:attribute name="id">CL-T19-R002</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[CL-T19-R002]-For Mime code in attribute use MIMEMediaType.</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M8" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="cac:ClassifiedTaxCategory/cbc:ID" mode="M8" priority="1000">
    <svrl:fired-rule context="cac:ClassifiedTaxCategory/cbc:ID" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="contains('�AA�AE�E�H�S�Z�',concat('�',normalize-space(.),'�'))" />
      <xsl:otherwise>
        <svrl:failed-assert test="contains('�AA�AE�E�H�S�Z�',concat('�',normalize-space(.),'�'))">
          <xsl:attribute name="id">CL-T19-R004</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[CL-T19-R004]-Tax categories MUST be coded using UN/ECE 5305 code list</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M8" select="*|comment()|processing-instruction()" />
  </xsl:template>
  <xsl:template match="text()" mode="M8" priority="-1" />
  <xsl:template match="@*|node()" mode="M8" priority="-2">
    <xsl:apply-templates mode="M8" select="*|comment()|processing-instruction()" />
  </xsl:template>

<!--PATTERN UBL-T19-->


	<!--RULE -->
<xsl:template match="/ubl:Catalogue" mode="M9" priority="1011">
    <svrl:fired-rule context="/ubl:Catalogue" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(cbc:CustomizationID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="(cbc:CustomizationID)">
          <xsl:attribute name="id">BII2-T19-R001</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T19-R001]-A catalogue MUST have a customization identifier</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(cbc:ProfileID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="(cbc:ProfileID)">
          <xsl:attribute name="id">BII2-T19-R002</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T19-R002]-A catalogue MUST have a profile identifier</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(cbc:IssueDate)" />
      <xsl:otherwise>
        <svrl:failed-assert test="(cbc:IssueDate)">
          <xsl:attribute name="id">BII2-T19-R003</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T19-R003]-A catalogue MUST contain the date of issue</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(cbc:ID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="(cbc:ID)">
          <xsl:attribute name="id">BII2-T19-R004</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T19-R004]-A catalogue MUST contain the catalogue document identifier</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(cac:ProviderParty)" />
      <xsl:otherwise>
        <svrl:failed-assert test="(cac:ProviderParty)">
          <xsl:attribute name="id">BII2-T19-R007</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T19-R007]-The party providing the catalogue MUST be specified</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(cac:ReceiverParty)" />
      <xsl:otherwise>
        <svrl:failed-assert test="(cac:ReceiverParty)">
          <xsl:attribute name="id">BII2-T19-R008</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T19-R008]-The party receiving the catalogue MUST be specified</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="count(cac:SellerSupplierParty) &lt;= 1" />
      <xsl:otherwise>
        <svrl:failed-assert test="count(cac:SellerSupplierParty) &lt;= 1">
          <xsl:attribute name="id">BII2-T19-R009</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T19-R009]-A catalogue MUST have maximum one catalogue supplier</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(cac:CatalogueLine)" />
      <xsl:otherwise>
        <svrl:failed-assert test="(cac:CatalogueLine)">
          <xsl:attribute name="id">BII2-T19-R023</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T19-R023]-A catalogue MUST have at least one catalogue line</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M9" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="//cac:ContractorCustomerParty" mode="M9" priority="1010">
    <svrl:fired-rule context="//cac:ContractorCustomerParty" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(cac:Party/cac:PartyName/cbc:Name) or (cac:Party/cac:PartyIdentification/cbc:ID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="(cac:Party/cac:PartyName/cbc:Name) or (cac:Party/cac:PartyIdentification/cbc:ID)">
          <xsl:attribute name="id">BII2-T19-R013</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T19-R013]-A catalogue customer MUST contain the full name or an identifier</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M9" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="//cac:CatalogueLine" mode="M9" priority="1009">
    <svrl:fired-rule context="//cac:CatalogueLine" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(cac:LineValidityPeriod) or ((cac:LineValidityPeriod/cbc:StartDate and cac:LineValidityPeriod/cbc:EndDate) and (number(translate(cac:LineValidityPeriod/cbc:StartDate,'-','')) >= number(translate(/ubl:Catalogue/cac:ValidityPeriod/cbc:StartDate,'-',''))) and  (number(translate(cac:LineValidityPeriod/cbc:EndDate,'-','')) &lt;= number(translate(/ubl:Catalogue/cac:ValidityPeriod/cbc:EndDate,'-',''))))" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(cac:LineValidityPeriod) or ((cac:LineValidityPeriod/cbc:StartDate and cac:LineValidityPeriod/cbc:EndDate) and (number(translate(cac:LineValidityPeriod/cbc:StartDate,'-','')) >= number(translate(/ubl:Catalogue/cac:ValidityPeriod/cbc:StartDate,'-',''))) and (number(translate(cac:LineValidityPeriod/cbc:EndDate,'-','')) &lt;= number(translate(/ubl:Catalogue/cac:ValidityPeriod/cbc:EndDate,'-',''))))">
          <xsl:attribute name="id">BII2-T19-R017</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T19-R017]-Catalogue line validity period MUST be within the range of the whole catalogue validity period</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not (cac:UsabilityPeriod) or ((//cac:UsabilityPeriod/cbc:StartDate and //cac:UsabilityPeriod/cbc:EndDate) and (number(translate(//cac:UsabilityPeriod/cbc:StartDate,'-','')) >= number(translate(//cac:LineValidityPeriod/cbc:StartDate,'-',''))) and  (number(translate(//cac:UsabilityPeriod/cbc:EndDate,'-','')) &lt;= number(translate(//cac:LineValidityPeriod/cbc:EndDate,'-',''))))" />
      <xsl:otherwise>
        <svrl:failed-assert test="not (cac:UsabilityPeriod) or ((//cac:UsabilityPeriod/cbc:StartDate and //cac:UsabilityPeriod/cbc:EndDate) and (number(translate(//cac:UsabilityPeriod/cbc:StartDate,'-','')) >= number(translate(//cac:LineValidityPeriod/cbc:StartDate,'-',''))) and (number(translate(//cac:UsabilityPeriod/cbc:EndDate,'-','')) &lt;= number(translate(//cac:LineValidityPeriod/cbc:EndDate,'-',''))))">
          <xsl:attribute name="id">BII2-T19-R018</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T19-R018]-Price validity period MUST be within the range of the whole catalogue line validity period</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(cbc:ID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="(cbc:ID)">
          <xsl:attribute name="id">BII2-T19-R024</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T19-R024]-A catalogue line MUST contain a unique line identifier</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(cbc:MinimumOrderQuantity) or number(cbc:MinimumOrderQuantity) >= 0" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(cbc:MinimumOrderQuantity) or number(cbc:MinimumOrderQuantity) >= 0">
          <xsl:attribute name="id">BII2-T19-R026</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T19-R026]-Orderable quantities MUST be greater than zero</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(cbc:MaximumOrderQuantity) or number(cbc:MaximumOrderQuantity) >= 0" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(cbc:MaximumOrderQuantity) or number(cbc:MaximumOrderQuantity) >= 0">
          <xsl:attribute name="id">BII2-T19-R029</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T19-R029]-Maximum quantity MUST be greater than zero</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(cbc:MinimumOrderQuantity) or number(cbc:MinimumOrderQuantity) >= 0" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(cbc:MinimumOrderQuantity) or number(cbc:MinimumOrderQuantity) >= 0">
          <xsl:attribute name="id">BII2-T19-R030</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T19-R030]-Minimum quantity MUST be greater than zero</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="not(cbc:MaximumOrderQuantity) or not(cbc:MinimumOrderQuantity) or number(cbc:MaximumOrderQuantity) >= number(cbc:MinimumOrderQuantity)" />
      <xsl:otherwise>
        <svrl:failed-assert test="not(cbc:MaximumOrderQuantity) or not(cbc:MinimumOrderQuantity) or number(cbc:MaximumOrderQuantity) >= number(cbc:MinimumOrderQuantity)">
          <xsl:attribute name="id">BII2-T19-R031</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T19-R031]-Maximum quantity MUST be greater or equal to the Minimum quantity</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M9" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="//cac:ProviderParty" mode="M9" priority="1008">
    <svrl:fired-rule context="//cac:ProviderParty" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(cac:PartyName/cbc:Name) or (cac:PartyIdentification/cbc:ID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="(cac:PartyName/cbc:Name) or (cac:PartyIdentification/cbc:ID)">
          <xsl:attribute name="id">BII2-T19-R010</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T19-R010]-A catalogue provider MUST contain the full name or an identifier</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M9" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="//cac:ReceiverParty" mode="M9" priority="1007">
    <svrl:fired-rule context="//cac:ReceiverParty" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(cac:PartyName/cbc:Name) or (cac:PartyIdentification/cbc:ID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="(cac:PartyName/cbc:Name) or (cac:PartyIdentification/cbc:ID)">
          <xsl:attribute name="id">BII2-T19-R011</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T19-R011]-A catalogue receiver MUST contain the full name or an identifier</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M9" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="//cac:SellerSupplierParty" mode="M9" priority="1006">
    <svrl:fired-rule context="//cac:SellerSupplierParty" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(cac:Party/cac:PartyName/cbc:Name) or (cac:Party/cac:PartyIdentification/cbc:ID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="(cac:Party/cac:PartyName/cbc:Name) or (cac:Party/cac:PartyIdentification/cbc:ID)">
          <xsl:attribute name="id">BII2-T19-R012</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T19-R012]-A catalogue supplier MUST contain the full name or an identifier</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M9" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="//cac:Item" mode="M9" priority="1005">
    <svrl:fired-rule context="//cac:Item" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(cbc:Name)" />
      <xsl:otherwise>
        <svrl:failed-assert test="(cbc:Name)">
          <xsl:attribute name="id">BII2-T19-R019</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T19-R019]-An item in a catalogue line SHOULD have a name</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(cac:StandardItemIdentification/cbc:ID) or  (cac:SellersItemIdentification/cbc:ID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="(cac:StandardItemIdentification/cbc:ID) or (cac:SellersItemIdentification/cbc:ID)">
          <xsl:attribute name="id">BII2-T19-R020</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T19-R020]-An item in a catalogue line MUST be uniquely identifiable by at least one of the following:
- Catalogue Provider identifier
- Standard identifier</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M9" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="//cac:CommodityClassification/cbc:ItemClassificationCode" mode="M9" priority="1004">
    <svrl:fired-rule context="//cac:CommodityClassification/cbc:ItemClassificationCode" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(@listID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="(@listID)">
          <xsl:attribute name="id">BII2-T19-R022</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T19-R022]-Classification codes SHOULD contain the Classification scheme Identifier (e.g. CPV or UNSPSC)</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M9" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="//cac:RequiredItemLocationQuantity/cac:Price" mode="M9" priority="1003">
    <svrl:fired-rule context="//cac:RequiredItemLocationQuantity/cac:Price" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="number(cbc:PriceAmount) >=0" />
      <xsl:otherwise>
        <svrl:failed-assert test="number(cbc:PriceAmount) >=0">
          <xsl:attribute name="id">BII2-T19-R015</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T19-R015]-Prices of items MUST not be negative</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M9" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="//cac:AdditionalItemProperty" mode="M9" priority="1002">
    <svrl:fired-rule context="//cac:AdditionalItemProperty" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(cbc:Value)" />
      <xsl:otherwise>
        <svrl:failed-assert test="(cbc:Value)">
          <xsl:attribute name="id">BII2-T19-R027</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T19-R027]-An item property data name  MUST specify a data value</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M9" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="//cac:StandardItemIdentification" mode="M9" priority="1001">
    <svrl:fired-rule context="//cac:StandardItemIdentification" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(cbc:ID/@schemeID)" />
      <xsl:otherwise>
        <svrl:failed-assert test="(cbc:ID/@schemeID)">
          <xsl:attribute name="id">BII2-T19-R021</xsl:attribute>
          <xsl:attribute name="flag">warning</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T19-R021]-Standard Identifiers SHOULD contain the Schema Identifier (e.g. GTIN)</svrl:text>
        </svrl:failed-assert>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M9" select="*|comment()|processing-instruction()" />
  </xsl:template>

	<!--RULE -->
<xsl:template match="//cac:ValidityPeriod" mode="M9" priority="1000">
    <svrl:fired-rule context="//cac:ValidityPeriod" />

		<!--ASSERT -->
<xsl:choose>
      <xsl:when test="(number(translate(cbc:StartDate,'-','')) &lt;= number(translate(cbc:EndDate,'-',''))) or (not(cbc:StartDate)) or (not(cbc:EndDate))" />
      <xsl:otherwise>
        <svrl:failed-assert test="(number(translate(cbc:StartDate,'-','')) &lt;= number(translate(cbc:EndDate,'-',''))) or (not(cbc:StartDate)) or (not(cbc:EndDate))">
          <xsl:attribute name="id">BII2-T19-R006</xsl:attribute>
          <xsl:attribute name="flag">fatal</xsl:attribute>
          <xsl:attribute name="location">
            <xsl:apply-templates mode="schematron-select-full-path" select="." />
          </xsl:attribute>
          <svrl:text>[BII2-T19-R006]-A validity period end date MUST be later or equal to a validity period start date if both validity period end date and validaty period start date are present</svrl:text>
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
