<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" 
	xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" 
	xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" 
	xmlns:ubl="urn:oasis:names:specification:ubl:schema:xsd:ApplicationResponse-2" 
	schemaVersion="iso" queryBinding="xslt2">
		
<title>OPENPEPPOL RULES for T110 bound to UBL 2.1</title>

<!--
	Editor: Georg Birgisson, Midran Limited
	Version 1.0
	2018-JAN
-->

  <ns prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"/>
  <ns prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"/>
  <ns prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:ApplicationResponse-2"/>
  <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>

	<pattern id="business_rules">

		<!-- Status: Test -->
		<rule context="cbc:ProfileID">
			<assert id="OP-T111-R001" 
					test="( normalize-space(.)='urn:www.peppol.eu:profile:bis63a:ver1.0' )" 
					flag="fatal">[OP-T111-R001]- An Invoice Message Response SHALL have the profile identifier "urn:www.peppol.eu:profile:bis63a:ver1.0".</assert>
		</rule>

		<!-- Status: Test -->
		<rule context="cbc:CustomizationID">
			<assert id="OP-T111-R002" 
					test="( normalize-space(.)='urn:www.peppol.eu:transaction:biitrns111:ver1.0' )" 
					flag="fatal">[OP-T111-R002]- An Invoice Message Response SHALL have the customization identifier "urn:www.peppol.eu:transaction:biitrns111:ver1.0".</assert>
		</rule>

		<!-- Status: Done
		[OP-0111-R003]-An Invoice Message Response SHALL contain the date of issue.
		Remark, it is not necessary to declare this rule because it is required by the UBL xsd. -->
	
		<rule context="ubl:ApplicationResponse">
			<!-- Status: Test -->
			<assert id="OP-T111-R004" 
					test="(count(cac:SenderParty/cbc:EndpointID)=1) and (*[not(normalize-space(cac:SenderParty/cbc:EndpointID))])" 
					flag="fatal">[OP-T111-R004]-The Endpoint ID for party sending Invoice Message Response SHALL be specified.</assert>

			<!-- Status: Test -->
			<assert id="OP-T111-R005" 
					test="(count(cac:SenderParty/cac:PartyName/cbc:Name)=1) and (*[not(normalize-space(cac:SenderParty/cac:PartyName/cbc:Name))])" 
					flag="fatal">[OP-T111-R005]-The party sending Invoice Message Response SHALL be specified.</assert>

			<!-- Status: Test -->
			<assert id="OP-T111-R006" 
					test="(count(cac:ReceiverParty/cbc:EndpointID)=1) and (*[not(normalize-space(cac:ReceiverParty/cbc:EndpointID))])" 
					flag="fatal">[OP-T111-R006]-The Endpoint ID for receiving sending Invoice Message Response SHALL be specified.</assert>

			<!-- Status: Test -->
			<assert id="OP-T111-R007" 
					test="(count(cac:ReceiverParty/cac:PartyName/cbc:Name)=1) and (*[not(normalize-space(cac:ReceiverParty/cac:PartyName/cbc:Name))])" 
					flag="fatal">[OP-T111-R007]-The party receiving Invoice Message Response SHALL be specified.</assert>
		</rule>

		<!-- Status: Test -->
		<rule context="cac:DocumentResponse/cac:DocumentReference">
			<assert id="OP-T111-R008"
					flag="fatal" 				
					test="count(cbc:ID)=1">[OP-T111-R008]-An Invoice Message Response SHALL contain a document reference pointing towards the business message that the response relates to.</assert>
		</rule>

		<!-- Status: Test -->
		<rule context="cac:DocumentResponse/cac:Response">
			<assert id="OP-0111-R009" 
				test="( ( not(contains(normalize-space(cbc:ResponseCode),' ')) and contains( ' CA UQ RE ',concat(' ',normalize-space(cbc:ResponseCode),' ') ) ) ) and count(cac:Status/cbc:StatusReasonCode)>=1 or (not(contains( ' CA UQ RE ',concat(' ',normalize-space(cbc:ResponseCode),' ') ) ) )" 
					flag="fatal" >[OP-0111-R009]-IF status code is one of: CA, UQ or RE then there SHALL be at a clarification code in Invoice Message Response.</assert>
		</rule>

	</pattern>

	<pattern id="codelist_rules">
  
		<!-- Status: Test -->
		<rule context="cac:DocumentResponse/cac:DocumentReference/cbc:DocumentTypeCode/@listID" >
			<assert id="CL-T111-R001" 
					test="( not(contains(normalize-space(.),' ')) and normalize-space(.)='UNCL1001' )" 
					flag="fatal" >[CL-T111-R001]-A document type code SHALL have a list identifier attribute 'UNCL1001'.</assert>
		</rule>

		<!-- Status: Test -->
		<rule context="cac:DocumentResponse/cac:DocumentReference/cbc:DocumentTypeCode">
			<assert id="CL-T111-R002" 
					test="( ( not(contains(normalize-space(.),' ')) and contains( ' 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 128 129 130 131 132 133 134 135 136 137 138 139 140 141 142 143 144 145 146 147 148 149 150 151 152 153 154 155 156 157 158 159 160 161 162 163 164 165 166 167 168 169 170 171 172 173 174 175 176 177 178 179 180 181 182 183 184 185 186 187 188 189 190 191 192 193 194 195 196 197 198 199 200 201 202 203 204 205 206 207 208 209 210 211 212 213 214 215 216 217 218 219 220 221 222 223 224 225 226 227 228 229 230 231 232 233 234 235 236 237 238 239 240 241 242 243 244 245 246 247 248 249 250 251 252 253 254 255 256 257 258 259 260 261 262 263 264 265 266 267 268 269 270 271 272 273 274 275 276 277 278 279 280 281 282 283 284 285 286 287 288 289 290 291 292 293 294 295 296 297 298 299 300 301 302 303 304 305 306 307 308 309 310 311 312 313 314 315 316 317 318 319 320 321 322 323 324 325 326 327 328 329 330 331 332 333 334 335 336 337 338 339 340 341 342 343 344 345 346 347 348 349 350 351 352 353 354 355 356 357 358 359 360 361 362 363 364 365 366 367 368 369 370 371 372 373 374 375 376 377 378 379 380 381 382 383 384 385 386 387 388 389 390 391 392 393 394 395 396 397 398 399 400 401 402 403 404 405 406 407 408 409 410 411 412 413 414 415 416 417 418 419 420 421 422 423 424 425 426 427 428 429 430 431 432 433 434 435 436 437 438 439 440 441 442 443 444 445 446 447 448 449 450 451 452 453 454 455 456 457 458 459 460 461 462 463 464 465 466 467 468 469 470 481 482 483 484 485 486 487 488 489 490 491 493 494 495 496 497 498 499 520 521 522 523 524 525 526 527 528 529 530 531 532 533 534 535 536 537 538 550 575 580 610 621 622 623 624 630 631 632 633 635 640 650 655 700 701 702 703 704 705 706 707 708 709 710 711 712 713 714 715 716 720 722 723 724 730 740 741 743 744 745 746 750 760 761 763 764 765 766 770 775 780 781 782 783 784 785 786 787 788 789 790 791 792 793 794 795 796 797 798 799 810 811 812 820 821 822 823 824 825 830 833 840 841 850 851 852 853 855 856 860 861 862 863 864 865 870 890 895 896 901 910 911 913 914 915 916 917 925 926 927 929 930 931 932 933 934 935 936 937 938 940 941 950 951 952 953 954 955 960 961 962 963 964 965 966 970 971 972 974 975 976 977 978 979 990 991 995 996 998 ',concat(' ',normalize-space(.),' ') ) ) )" 
					flag="fatal" >[CL-T111-R002]-A document type code MUST be coded using UNCL 1001 list BII2 subset</assert>
		</rule>

		<!-- Status: Test -->
		<rule context="//cbc:EndpointID/@schemeID">
			<assert id="CL-T111-R003" 
					test="( ( not(contains(normalize-space(.),' ')) and contains( ' FR:SIRENE SE:ORGNR FR:SIRET FI:OVT DUNS GLN DK:P IT:FTI NL:KVK IT:SIA IT:SECETI DIGST DK:CPR DK:CVR DK:SE DK:VANS IT:VAT IT:CF NO:ORGNR NO:VAT HU:VAT EU:REID AT:VAT AT:GOV IS:KT IBAN AT:KUR ES:VAT IT:IPA AD:VAT AL:VAT BA:VAT BE:VAT BG:VAT CH:VAT CY:VAT CZ:VAT DE:VAT EE:VAT GB:VAT GR:VAT HR:VAT IE:VAT LI:VAT LT:VAT LU:VAT LV:VAT MC:VAT ME:VAT MK:VAT MT:VAT NL:VAT PL:VAT PT:VAT RO:VAT RS:VAT SI:VAT SK:VAT SM:VAT TR:VAT VA:VAT NL:ION NL:OIN SE:VAT BE:CBE FR:VAT ZZZ ',concat(' ',normalize-space(.),' ') ) ) )" 
					flag="fatal">[CL-T111-R003]-An Endpoint Identifier Scheme MUST be from the list of PEPPOL Party Identifiers described in the "PEPPOL Policy for using Identifiers".</assert>
		</rule>

		<!-- Status: Test -->
		<rule context="//cac:PartyIdentification/cbc:ID/@schemeID">
			<assert id="CL-T111-R004" 
					test="( ( not(contains(normalize-space(.),' ')) and contains( ' FR:SIRENE SE:ORGNR FR:SIRET FI:OVT DUNS GLN DK:P IT:FTI NL:KVK IT:SIA IT:SECETI DIGST DK:CPR DK:CVR DK:SE DK:VANS IT:VAT IT:CF NO:ORGNR NO:VAT HU:VAT EU:REID AT:VAT AT:GOV IS:KT IBAN AT:KUR ES:VAT IT:IPA AD:VAT AL:VAT BA:VAT BE:VAT BG:VAT CH:VAT CY:VAT CZ:VAT DE:VAT EE:VAT GB:VAT GR:VAT HR:VAT IE:VAT LI:VAT LT:VAT LU:VAT LV:VAT MC:VAT ME:VAT MK:VAT MT:VAT NL:VAT PL:VAT PT:VAT RO:VAT RS:VAT SI:VAT SK:VAT SM:VAT TR:VAT VA:VAT NL:ION NL:OIN SE:VAT BE:CBE FR:VAT ZZZ ',concat(' ',normalize-space(.),' ') ) ) )" 
					flag="fatal">[CL-T111-R004]-An Party Identifier Scheme MUST be from the list of PEPPOL Party Identifiers described in the "PEPPOL Policy for using Identifiers".</assert>
		</rule>

		<!-- Status: Test -->
		<rule context="cac:DocumentResponse/cac:Response/cbc:ResponseCode/@listID">
			<assert id="CL-T111-R005" 
					test="( ( not(contains(normalize-space(.),' ')) and contains(normalize-space(.),'UNCL4343OpSubset') ) )" 
					flag="fatal" >[CL-T111-R005]-A Status Code SHALL have list ID as UNCL4343OpSubset.</assert>
		</rule>

		<!-- Status: Test -->
		<rule context="cac:DocumentResponse/cac:Response/cbc:ResponseCode">
			<assert id="CL-T111-R006" 
					test="( ( not(contains(normalize-space(.),' ')) and contains( ' IP UQ CA RE AP PD AB ',concat(' ',normalize-space(.),' ') ) ) )" 
					flag="fatal">[CL-T111-R006]-A Status code value SHALL be one of the values from the UNCL 4343 PEPPOL Subset code list described in chapter 8.3.1</assert>
		</rule>

		<!-- Status: Test -->
		<rule context="cac:DocumentResponse/cac:Response/cac:Status/cbc:StatusReasonCode">
			<assert id="CL-T111-R007" 
					test="( ( not(contains(normalize-space(.),' ')) and (@listID != '') ) ) " 
					flag="fatal">[CL-T111-R007]-Clarification code SHALL have a list id.</assert>
		
			<assert id="CL-T111-R008" 
				test="( ( not(contains(normalize-space(@listID),' ')) and contains( ' OPStatusReason OPStatusAction ',concat(' ',normalize-space(@listID),' ') ) ) )" 
					flag="warning">[CL-T111-R008]-A Clarification code SHOULD have a list identifier attribute OPStatusReason or OPStatusAction or else the Invoice Response is using extended codes.</assert>
	
			<assert id="CL-T111-R009" 
					test="( ( not(contains(normalize-space(.),' ')) and contains( ' NON REF LEG REC QUA DEL PRI QTY ITM PAY UNR FIN ',concat(' ',normalize-space(.),' ') ) and (@listID = 'OPStatusReason') ) ) or (not(@listID = 'OPStatusReason'))" 
					flag="fatal">[CL-T111-R009]-IF Clarification codes list ID is OPStatusReason then the code SHALL be from the OPStatusReason code list.</assert>

			<assert id="CL-T111-R010" 
				test="( ( not(contains(normalize-space(.),' ')) and contains( ' NOA PIN NIN CNF CNP CNA ',concat(' ',normalize-space(.),' ') ) and (@listID = 'OPStatusAction') ) ) or (not(@listID = 'OPStatusAction'))" 
					flag="fatal">[CL-T111-R010]-IF Clarification codes list id is OPStatusAction then the code SHALL be from the OPStatusAction code list.</assert>
		</rule>

		<!-- Status: Test -->
		<rule context="cbc:EndpointID">
			<assert id="CL-T111-R011" 
					test="@schemeID" 
					flag="fatal">[CL-T111-R011]-An endpoint identifier SHALL have a scheme identifier attribute.</assert>
		</rule>

		<!-- Status: Test -->
		<rule context="cac:PartyIdentification/cbc:ID">
			<assert id="CL-T111-R012" 
					test="@schemeID"
					flag="fatal">[CL-T111-R012]-A party identifier SHALL have a scheme identifier attribute.</assert>
		</rule>

	</pattern>
</schema>