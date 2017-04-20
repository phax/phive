<?xml version="1.0" encoding="UTF-8"?>

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="SI-V12-PO-CODES">
    <!-- Version check -->
  <rule context="node()[not(contains(//cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biitrns001:ver2.0:extended:urn:www.peppol.eu:bis:peppol3a:ver2.0:extended:urn:www.simplerinvoicing.org:si:si-ubl:ver1.2'))] | @*[not(contains(//cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biitrns001:ver2.0:extended:urn:www.peppol.eu:bis:peppol3a:ver2.0:extended:urn:www.simplerinvoicing.org:si:si-ubl:ver1.2'))]">
    <assert test="true()" />
  </rule>
    <!-- end of version check -->
    <!-- End backwards compatibiltiy statement -->

    <rule context="cac:OriginCountry/cbc:IdentificationCode" flag="fatal">
        <assert test="( ( not(contains(normalize-space(.),' ')) and contains( ' AD AE AF AG AI AL AM AN AO AQ AR AS AT AU AW AX AZ BA BB BD BE BF BG BH BI BJ BL BM BN BO BQ BR BS BT BV BW BY BZ CA CC CD CF CG CH CI CK CL CM CN CO CR CU CV CW CX CY CZ DE DJ DK DM DO DZ EC EE EG EH ER ES ET FI FJ FK FM FO FR GA GB GD GE GF GG GH GI GL GM GN GP GQ GR GS GT GU GW GY HK HM HN HR HT HU ID IE IL IM IN IO IQ IR IS IT JE JM JO JP KE KG KH KI KM KN KP KR KW KY KZ LA LB LC LI LK LR LS LT LU LV LY MA MC MD ME MF MG MH MK ML MM MN MO MP MQ MR MS MT MU MV MW MX MY MZ NA NC NE NF NG NI NL NO NP NR NU NZ OM PA PE PF PG PH PK PL PM PN PR PS PT PW PY QA RO RE RS RU RW SA SB SC SD SE SG SH SI SJ SK SL SM SN SO SR ST SV SX SY SZ TC TD TF TG TH TJ TK TL TM TN TO TR TT TV TW TZ UA UG UM US UY UZ VA VC VE VG VI VN VU WF WS YE YT ZA ZM ZW ',concat(' ',normalize-space(.),' ') ) ) )" flag="fatal">[SI-V12-CODE-R003]-Country codes in an order MUST be coded using ISO code list 3166-1</assert>
    </rule>
</pattern>
