<schema xmlns="http://purl.oclc.org/dsdl/schematron"
        xmlns:u="utils"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:xi="http://www.w3.org/2001/XInclude"
        schemaVersion="iso"
        queryBinding="xslt2">

    <title>Rules for PEPPOL Message Level Response transaction 3.0</title>
    
    <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
       prefix="cbc"/>
    <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
       prefix="cac"/>
    <ns uri="urn:oasis:names:specification:ubl:schema:xsd:applicationResponse-2"
       prefix="ubl"/>
    <ns uri="http://www.w3.org/2001/XMLSchema" prefix="xs"/>
    <ns uri="utils" prefix="u"/>
    
    <xsl:key name="k_lineId" match="cac:LineItem" use="cbc:ID"/>
    
    

    <function xmlns="http://www.w3.org/1999/XSL/Transform"
             name="u:gln"
             as="xs:boolean">
      <param name="val"/>
      <variable name="length" select="string-length($val) - 1"/>
      <variable name="digits"
                select="reverse(for $i in string-to-codepoints(substring($val, 0, $length + 1)) return $i - 48)"/>
      <variable name="weightedSum"
                select="sum(for $i in (0 to $length - 1) return $digits[$i + 1] * (1 + ((($i + 1) mod 2) * 2)))"/>
      <value-of select="10 - ($weightedSum mod 10) = number(substring($val, $length + 1, 1))"/>
   </function>
    <function xmlns="http://www.w3.org/1999/XSL/Transform"
             name="u:mod11"
             as="xs:boolean">
      <param name="val"/>
      <variable name="length" select="string-length($val) - 1"/>
      <variable name="digits"
                select="reverse(for $i in string-to-codepoints(substring($val, 0, $length + 1)) return $i - 48)"/>
      <variable name="weightedSum"
                select="sum(for $i in (0 to $length - 1) return $digits[$i + 1] * (($i mod 6) + 2))"/>
      <value-of select="number($val) &gt; 0 and (11 - ($weightedSum mod 11)) mod 11 = number(substring($val, $length + 1, 1))"/>
   </function>

    

    <pattern>
      <rule context="cbc:*">
        <assert id="PEPPOL-COMMON-R001" test=". != ''" flag="fatal">Document MUST not contain empty elements.</assert>
      </rule>

      <rule context="cac:*">
        <assert id="PEPPOL-COMMON-R002" test="count(*) != 0" flag="fatal">Document MUST not contain empty elements.</assert>
      </rule>
   </pattern>
    <pattern>

      <rule context="/*">
        <assert id="PEPPOL-COMMON-R003"
                 test="not(@*:schemaLocation)"
                 flag="warning">Document SHOULD not contain schema location.</assert>

      </rule>

      <rule context="cbc:IssueDate | cbc:DueDate | cbc:TaxPointDate | cbc:StartDate | cbc:EndDate | cbc:ActualDeliveryDate">
        <assert id="PEPPOL-COMMON-R030"
                 test="(string(.) castable as xs:date) and (string-length(.) = 10)"
                 flag="fatal">A date must be formatted YYYY-MM-DD.</assert>
      </rule>

    
      <rule context="cbc:EndpointID[@schemeID = '0088'] | cac:PartyIdentification/cbc:ID[@schemeID = '0088'] | cbc:CompanyID[@schemeID = '0088']">
        <assert id="PEPPOL-COMMON-R040"
                 test="matches(normalize-space(), '^[0-9]+$') and u:gln(normalize-space())"
                 flag="warning">Invalid GLN number provided.</assert>
      </rule>
      <rule context="cbc:EndpointID[@schemeID = '0192'] | cac:PartyIdentification/cbc:ID[@schemeID = '0192'] | cbc:CompanyID[@schemeID = '0192']">
        <assert id="PEPPOL-COMMON-R041"
                 test="matches(normalize-space(), '^[0-9]{9}$') and u:mod11(normalize-space())"
                 flag="fatal">Invalid Norwegian organization number provided.</assert>
      </rule>

   </pattern>
    <pattern xmlns:ns2="http://www.schematron-quickfix.com/validator/process">
      <let name="cleas"
           value="tokenize('0002 0007 0009 0037 0060 0088 0096 0097 0106 0135 0142 0184 0190 0191 0192 0193 0195 0196 0198 0199 0200 9901 9902 9904 9905 9906 9907 9910 9913 9914 9915 9917 9918 9919 9920 9921 9922 9923 9924 9925 9926 9927 9928 9929 9930 9931 9932 9933 9934 9935 9936 9937 9938 9939 9940 9941 9942 9943 9944 9945 9946 9947 9948 9949 9950 9951 9952 9953 9955 9956 9957 9958', '\s')"/>
      <let name="clUNCL1001"
           value="tokenize('1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 128 129 130 131 132 133 134 135 136 137 138 139 140 141 142 143 144 145 146 147 148 149 150 151 152 153 154 155 156 157 158 159 160 161 162 163 164 165 166 167 168 169 170 171 172 173 174 175 176 177 178 179 180 181 182 183 184 185 186 187 188 189 190 191 192 193 194 195 196 197 198 199 200 201 202 203 204 205 206 207 208 209 210 211 212 213 214 215 216 217 218 219 220 221 222 223 224 225 226 227 228 229 230 231 232 233 234 235 236 237 238 239 240 241 242 243 244 245 246 247 248 249 250 251 252 253 254 255 256 257 258 259 260 261 262 263 264 265 266 267 268 269 270 271 272 273 274 275 276 277 278 279 280 281 282 283 284 285 286 287 288 289 290 291 292 293 294 295 296 297 298 299 300 301 302 303 304 305 306 307 308 309 310 311 312 313 314 315 316 317 318 319 320 321 322 323 324 325 326 327 328 329 330 331 332 333 334 335 336 337 338 339 340 341 342 343 344 345 346 347 348 349 350 351 352 353 354 355 356 357 358 359 360 361 362 363 364 365 366 367 368 369 370 371 372 373 374 375 376 377 378 379 380 381 382 383 384 385 386 387 388 389 390 391 392 393 394 395 396 397 398 399 400 401 402 403 404 405 406 407 408 409 410 411 412 413 414 415 416 417 418 419 420 421 422 423 1999 424 425 426 427 428 429 430 431 432 433 434 435 436 437 438 439 440 441 442 443 444 445 446 447 448 449 450 451 452 453 454 455 456 457 458 459 460 461 462 463 464 465 466 467 468 469 470 481 482 483 484 485 486 487 488 489 490 491 493 494 495 496 497 498 499 520 521 522 523 524 525 526 527 528 529 530 531 532 533 534 535 536 537 538 539 550 551 552 553 554 575 576 577 578 579 580 581 582 583 584 585 586 587 588 589 610 621 622 623 624 625 626 627 628 629 630 631 632 633 634 635 636 637 638 639 640 641 642 643 644 645 646 647 648 649 650 651 652 653 654 655 656 657 658 659 700 701 702 703 704 705 706 707 708 709 710 711 712 713 714 715 716 717 718 719 720 721 722 723 724 725 726 727 728 729 730 731 732 733 734 735 736 737 738 739 740 741 742 743 744 745 746 747 748 749 750 751 760 761 763 764 765 766 770 775 780 781 782 783 784 785 786 787 788 789 790 791 792 793 794 795 796 797 798 799 810 811 812 820 821 822 823 824 825 830 833 840 841 850 851 852 853 855 856 860 861 862 863 864 865 870 890 895 896 901 910 911 913 914 915 916 917 925 926 927 929 930 931 932 933 934 935 936 937 938 940 941 950 951 952 953 954 955 960 961 962 963 964 965 966 970 971 972 974 975 976 977 978 979 990 991 995 996 998', '\s')"/>
      <let name="clStatusReason" value="tokenize('BV BW SV', '\s')"/>
      <let name="clUNCL4343" value="tokenize('AB AP RE', '\s')"/>
      <rule context="/ubl:ApplicationResponse">
         <assert test="cbc:CustomizationID" flag="fatal" id="PEPPOL-T71-B00101">Element 'cbc:CustomizationID' MUST be provided.</assert>
         <assert test="cbc:ProfileID" flag="fatal" id="PEPPOL-T71-B00102">Element 'cbc:ProfileID' MUST be provided.</assert>
         <assert test="cbc:ID" flag="fatal" id="PEPPOL-T71-B00103">Element 'cbc:ID' MUST be provided.</assert>
         <assert test="cbc:IssueDate" flag="fatal" id="PEPPOL-T71-B00104">Element 'cbc:IssueDate' MUST be provided.</assert>
         <assert test="cac:SenderParty" flag="fatal" id="PEPPOL-T71-B00105">Element 'cac:SenderParty' MUST be provided.</assert>
         <assert test="cac:ReceiverParty" flag="fatal" id="PEPPOL-T71-B00106">Element 'cac:ReceiverParty' MUST be provided.</assert>
         <assert test="cac:DocumentResponse" flag="fatal" id="PEPPOL-T71-B00107">Element 'cac:DocumentResponse' MUST be provided.</assert>
         <assert test="not(@*:schemaLocation)" flag="fatal" id="PEPPOL-T71-B00108">Document MUST not contain schema location.</assert>
      </rule>
      <rule context="/ubl:ApplicationResponse/cbc:CustomizationID">
         <assert test="normalize-space(text()) = 'urn:fdc:peppol.eu:poacc:trns:mlr:3'"
                 flag="fatal"
                 id="PEPPOL-T71-B00201">Element 'cbc:CustomizationID' MUST contain value 'urn:fdc:peppol.eu:poacc:trns:mlr:3'.</assert>
      </rule>
      <rule context="/ubl:ApplicationResponse/cbc:ProfileID">
         <assert test="normalize-space(text()) = 'urn:fdc:peppol.eu:poacc:bis:mlr:3'"
                 flag="fatal"
                 id="PEPPOL-T71-B00301">Element 'cbc:ProfileID' MUST contain value 'urn:fdc:peppol.eu:poacc:bis:mlr:3'.</assert>
      </rule>
      <rule context="/ubl:ApplicationResponse/cbc:ID"/>
      <rule context="/ubl:ApplicationResponse/cbc:IssueDate"/>
      <rule context="/ubl:ApplicationResponse/cbc:IssueTime"/>
      <rule context="/ubl:ApplicationResponse/cac:SenderParty">
         <assert test="cbc:EndpointID" flag="fatal" id="PEPPOL-T71-B00701">Element 'cbc:EndpointID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:ApplicationResponse/cac:SenderParty/cbc:EndpointID">
         <assert test="@schemeID" flag="fatal" id="PEPPOL-T71-B00801">Attribute 'schemeID' MUST be present.</assert>
         <assert test="not(@schemeID) or (some $code in $cleas satisfies $code = @schemeID)"
                 flag="fatal"
                 id="PEPPOL-T71-B00802">Value MUST be part of code list 'Electronic Address Scheme (EAS)'.</assert>
      </rule>
      <rule context="/ubl:ApplicationResponse/cac:SenderParty/*">
         <assert test="false()" flag="fatal" id="PEPPOL-T71-B00702">Document MUST NOT contain elements not part of the data model.</assert>
      </rule>
      <rule context="/ubl:ApplicationResponse/cac:ReceiverParty">
         <assert test="cbc:EndpointID" flag="fatal" id="PEPPOL-T71-B01001">Element 'cbc:EndpointID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:ApplicationResponse/cac:ReceiverParty/cbc:EndpointID">
         <assert test="@schemeID" flag="fatal" id="PEPPOL-T71-B01101">Attribute 'schemeID' MUST be present.</assert>
         <assert test="not(@schemeID) or (some $code in $cleas satisfies $code = @schemeID)"
                 flag="fatal"
                 id="PEPPOL-T71-B01102">Value MUST be part of code list 'Electronic Address Scheme (EAS)'.</assert>
      </rule>
      <rule context="/ubl:ApplicationResponse/cac:ReceiverParty/*">
         <assert test="false()" flag="fatal" id="PEPPOL-T71-B01002">Document MUST NOT contain elements not part of the data model.</assert>
      </rule>
      <rule context="/ubl:ApplicationResponse/cac:DocumentResponse">
         <assert test="cac:Response" flag="fatal" id="PEPPOL-T71-B01301">Element 'cac:Response' MUST be provided.</assert>
         <assert test="cac:DocumentReference" flag="fatal" id="PEPPOL-T71-B01302">Element 'cac:DocumentReference' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:ApplicationResponse/cac:DocumentResponse/cac:Response">
         <assert test="cbc:ResponseCode" flag="fatal" id="PEPPOL-T71-B01401">Element 'cbc:ResponseCode' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:ApplicationResponse/cac:DocumentResponse/cac:Response/cbc:ResponseCode">
         <assert test="(some $code in $clUNCL4343 satisfies $code = normalize-space(text()))"
                 flag="fatal"
                 id="PEPPOL-T71-B01501">Value MUST be part of code list 'Application Response type code (UNCL4343 Subset)'.</assert>
      </rule>
      <rule context="/ubl:ApplicationResponse/cac:DocumentResponse/cac:Response/cbc:Description"/>
      <rule context="/ubl:ApplicationResponse/cac:DocumentResponse/cac:Response/*">
         <assert test="false()" flag="fatal" id="PEPPOL-T71-B01402">Document MUST NOT contain elements not part of the data model.</assert>
      </rule>
      <rule context="/ubl:ApplicationResponse/cac:DocumentResponse/cac:DocumentReference">
         <assert test="cbc:ID" flag="fatal" id="PEPPOL-T71-B01701">Element 'cbc:ID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:ApplicationResponse/cac:DocumentResponse/cac:DocumentReference/cbc:ID"/>
      <rule context="/ubl:ApplicationResponse/cac:DocumentResponse/cac:DocumentReference/cbc:DocumentTypeCode">
         <assert test="(some $code in $clUNCL1001 satisfies $code = normalize-space(text()))"
                 flag="fatal"
                 id="PEPPOL-T71-B01901">Value MUST be part of code list 'Document name code, full list (UNCL1001)'.</assert>
      </rule>
      <rule context="/ubl:ApplicationResponse/cac:DocumentResponse/cac:DocumentReference/cbc:VersionID"/>
      <rule context="/ubl:ApplicationResponse/cac:DocumentResponse/cac:DocumentReference/*">
         <assert test="false()" flag="fatal" id="PEPPOL-T71-B01702">Document MUST NOT contain elements not part of the data model.</assert>
      </rule>
      <rule context="/ubl:ApplicationResponse/cac:DocumentResponse/cac:LineResponse">
         <assert test="cac:LineReference" flag="fatal" id="PEPPOL-T71-B02101">Element 'cac:LineReference' MUST be provided.</assert>
         <assert test="cac:Response" flag="fatal" id="PEPPOL-T71-B02102">Element 'cac:Response' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:LineReference">
         <assert test="cbc:LineID" flag="fatal" id="PEPPOL-T71-B02201">Element 'cbc:LineID' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:LineReference/cbc:LineID"/>
      <rule context="/ubl:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:LineReference/*">
         <assert test="false()" flag="fatal" id="PEPPOL-T71-B02202">Document MUST NOT contain elements not part of the data model.</assert>
      </rule>
      <rule context="/ubl:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:Response">
         <assert test="cbc:Description" flag="fatal" id="PEPPOL-T71-B02401">Element 'cbc:Description' MUST be provided.</assert>
         <assert test="cac:Status" flag="fatal" id="PEPPOL-T71-B02402">Element 'cac:Status' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:Response/cbc:ResponseCode">
         <assert test="(some $code in $clUNCL4343 satisfies $code = normalize-space(text()))"
                 flag="fatal"
                 id="PEPPOL-T71-B02501">Value MUST be part of code list 'Application Response type code (UNCL4343 Subset)'.</assert>
      </rule>
      <rule context="/ubl:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:Response/cbc:Description"/>
      <rule context="/ubl:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:Response/cac:Status">
         <assert test="cbc:StatusReasonCode" flag="fatal" id="PEPPOL-T71-B02701">Element 'cbc:StatusReasonCode' MUST be provided.</assert>
      </rule>
      <rule context="/ubl:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:Response/cac:Status/cbc:StatusReasonCode">
         <assert test="(some $code in $clStatusReason satisfies $code = normalize-space(text()))"
                 flag="fatal"
                 id="PEPPOL-T71-B02801">Value MUST be part of code list 'Status reason code (openPEPPOL)'.</assert>
      </rule>
      <rule context="/ubl:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:Response/cac:Status/*">
         <assert test="false()" flag="fatal" id="PEPPOL-T71-B02702">Document MUST NOT contain elements not part of the data model.</assert>
      </rule>
      <rule context="/ubl:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/cac:Response/*">
         <assert test="false()" flag="fatal" id="PEPPOL-T71-B02403">Document MUST NOT contain elements not part of the data model.</assert>
      </rule>
      <rule context="/ubl:ApplicationResponse/cac:DocumentResponse/cac:LineResponse/*">
         <assert test="false()" flag="fatal" id="PEPPOL-T71-B02103">Document MUST NOT contain elements not part of the data model.</assert>
      </rule>
      <rule context="/ubl:ApplicationResponse/cac:DocumentResponse/*">
         <assert test="false()" flag="fatal" id="PEPPOL-T71-B01303">Document MUST NOT contain elements not part of the data model.</assert>
      </rule>
      <rule context="/ubl:ApplicationResponse/*">
         <assert test="false()" flag="fatal" id="PEPPOL-T71-B00109">Document MUST NOT contain elements not part of the data model.</assert>
      </rule>
   </pattern>
    

</schema>
