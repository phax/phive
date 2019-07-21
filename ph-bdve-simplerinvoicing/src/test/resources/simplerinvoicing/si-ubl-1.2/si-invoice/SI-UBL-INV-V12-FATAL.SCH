<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="SI-V12-INV">
    <!-- Version check -->
    <rule context="node()[not(contains(//cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biitrns010:ver2.0:extended:urn:www.peppol.eu:bis:peppol4a:ver2.0:extended:urn:www.simplerinvoicing.org:si:si-ubl:ver1.2'))] | @*[not(contains(//cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biitrns010:ver2.0:extended:urn:www.peppol.eu:bis:peppol4a:ver2.0:extended:urn:www.simplerinvoicing.org:si:si-ubl:ver1.2'))]">
        <assert test="true()" />
    </rule>
    <!-- if we want to warn for new version, this would be a good place -->
    <!--
    <rule context="ubl:Invoice" flag="warning">
        <assert test="false()" flag="warning">[SI-UBL-INV-R000]-Simplerinvoicing v1.1 validation is used but will soon be obsolete, please move to Simplerinvoicing v1.2</assert>
    </rule>
    -->
    <!-- end of warning for new version -->
    <!-- End of version check -->
    <!-- End backwards compatibiltiy statement -->
    <!-- must be si 1.0 to 1.2 -->
    <rule context="cbc:CustomizationID">
        <assert test="contains(normalize-space(.), 'urn:www.cenbii.eu:transaction:biitrns010:ver2.0:extended:urn:www.peppol.eu:bis:peppol4a:ver2.0:extended:urn:www.simplerinvoicing.org:si:si-ubl:ver1.1') or
                      contains(normalize-space(.), 'urn:www.cenbii.eu:transaction:biitrns010:ver2.0:extended:urn:www.peppol.eu:bis:peppol4a:ver2.0:extended:urn:www.simplerinvoicing.org:si:si-ubl:ver1.2') or
                      contains(normalize-space(.), 'urn:www.simplerinvoicing.org:si-ubl:invoice:ver1.0.x')
                     " flag="fatal">[SI-V12-INV-R200]-This XML instance is NOT tagged as an SI-UBL invoice; please check the CustomizationID value</assert>
    </rule>
    <rule context="/" flag="fatal">
        <assert test="ubl:Invoice" flag="fatal">[SI-INV-R000]-This is NOT a UBL 2.x Invoice, validation cannot continue</assert>
    </rule>

    <rule context="ubl:Invoice" flag="fatal">
        <assert test="cbc:UBLVersionID='2.1'" flag="fatal">[SI-V12-INV-R001]-Each invoice MUST be specified as a UBL 2.1 document</assert>
        <assert test="cbc:InvoiceTypeCode" flag="fatal">[SI-V12-INV-R002]-Each invoice MUST have an InvoiceTypeCode declaration</assert>
        <assert test="cbc:InvoiceTypeCode!='384' or cac:BillingReference" flag="fatal">[SI-V12-INV-R453]-For corrective invoices a billing reference MUST be set</assert>
        <assert test="cbc:CustomizationID" flag="fatal">[BII2-T10-R001] An invoice MUST have a customization identifier</assert>
    </rule>
    <rule context="cbc:CompanyID" flag="fatal">
        <assert test="@schemeID" flag="fatal">[SI-V12-INV-R003]-A CompanyID MUST be specified using a PEPPOL Party identifier</assert>
    </rule>
    <rule context="cac:ExternalReference" flag="fatal">
        <assert test="normalize-space(cbc:URI) != ''" flag="fatal">[SI-V12-INV-R004]-An external reference MUST have its uri specified</assert>
    </rule>
    <rule context="cac:Country | cac:OriginCountry" flag="fatal">
        <assert test="cbc:IdentificationCode" flag="fatal">[SI-V12-INV-R005]-A country MUST be identified by a two-letter identification code as specified in ISO3166-1:Alpha2</assert>
    </rule>
    <rule context="cac:TaxScheme" flag="fatal">
        <assert test="cbc:ID/@schemeID='UN/ECE 5153'" flag="fatal">[SI-V12-INV-R006]-A tax scheme MUST have an identifier specifying it uses the UN/ECE 5153 list</assert>
    </rule>
    <rule context="cac:PartyLegalEntity" flag="fatal">
        <assert test="cbc:CompanyID" flag="fatal">[SI-V12-INV-R007]-A legal entity MUST have a company identifier</assert>
    </rule>
    <rule context="cac:DeliveryTerms" flag="fatal">
        <assert test="normalize-space(cbc:SpecialTerms/text()) != ''" flag="fatal">[SI-V12-INV-R008]-If delivery terms are specified they MUST be expressed as special conditions</assert>
    </rule>
    <rule context="cbc:PrimaryAccountNumberID" flag="fatal">
        <assert test="normalize-space(text()) != ''" flag="fatal">[SI-V12-INV-R009]-A primary account number MUST be specified if a card account is used</assert>
    </rule>
    <rule context="cbc:NetworkID" flag="fatal">
        <assert test="normalize-space(text()) != ''" flag="fatal">[SI-V12-INV-R010]-A network id MUST be specified if a card account is used</assert>
    </rule>
    <rule context="cac:PayeeFinancialAccount" flag="fatal">
        <assert test="cbc:ID" flag="fatal">[SI-V12-INV-R011]-A financial account MUST have an id</assert>
    </rule>
    <rule context="cbc:ID[parent::cac:PayeeFinancialAccount]" flag="fatal">
        <assert test="string-length(normalize-space(text())) &gt; 0" flag="fatal">[SI-V12-INV-R012]-A financial account id MUST have a value</assert>
    </rule>
    <rule context="cac:FinancialInstitution" flag="fatal">
        <assert test="cbc:ID" flag="fatal">[SI-V12-INV-R013]-A financial institution MUST have an id</assert>
    </rule>
    <rule context="cbc:ID[parent::cac:FinancialInstitution]" flag="fatal">
        <assert test="string-length(normalize-space(text())) &gt; 0" flag="fatal">[SI-V12-INV-R014]-A financial institution id MUST have a value</assert>
    </rule>
    <rule context="cac:TaxCategory" flag="fatal">
        <assert test="cbc:ID" flag="fatal">[SI-V12-INV-R015]-A tax category MUST have an id</assert>
        <assert test="string(cbc:ID) != 'S' or cbc:Percent" flag="fatal">[SI-V12-INV-R016]-The VAT category percentage MUST be provided if the VAT category code is standard.</assert>
    </rule>
    <rule context="cbc:MathematicOperatorCode" flag="fatal">
        <assert test="translate(text(), 'MULTIPLY', 'multiply') = 'multiply' or translate(text(), 'DIVE', 'dive') = 'divide'" flag="fatal">[SI-V12-INV-R017]-A mathematic operator MUST be specified as a code specifying whether the calculation rate is a multiplier or divisor</assert>
    </rule>
    <rule context="cac:LegalMonetaryTotal" flag="fatal">
        <assert test="not(/ubl:Invoice/cac:AllowanceCharge[cbc:ChargeIndicator='false']) or cbc:AllowanceTotalAmount" flag="fatal">[SI-V12-INV-R018]-An allowance total MUST be specified when allowances are applicable</assert>
        <assert test="not(/ubl:Invoice/cac:AllowanceCharge[cbc:ChargeIndicator='true']) or cbc:ChargeTotalAmount" flag="fatal">[SI-V12-INV-R019]-A charge total MUST be specified when charges are applicable</assert>
    </rule>
    <rule context="cac:Item" flag="fatal">
        <assert test="cbc:Name" flag="fatal">[SI-V12-INV-R020]-An item on an invoiceline MUST have a name</assert>
    </rule>
    <rule context="cac:OriginCountry/cbc:IdentificationCode" flag="fatal">
        <assert test="@listID='ISO3166-1:Alpha2'" flag="fatal">[SI-V12-INV-R021]-A country identification code MUST have a list identifier attribute 'ISO3166-1:Alpha2'</assert>
    </rule>
    <rule context="cac:AdditionalItemProperty" flag="fatal">
        <assert test="cbc:Value and cbc:Name" flag="fatal">[SI-V12-INV-R022]-An additional item property MUST have a name and a value</assert>
    </rule>
    <rule context="cac:InvoiceLine" flag="fatal">
        <assert test="cac:Price" flag="fatal">[SI-V12-INV-R023]-An invoiceline MUST have a price section</assert>
    </rule>
    <rule context="ubl:Invoice/cac:PayeeParty" flag="fatal">
        <assert test="cac:PartyName/cbc:Name" flag="fatal">[SI-V12-INV-R024]-If payee information is provided then the payee name MUST be specified.</assert>
    </rule>
    <rule context="cbc:TransactionCurrencyTaxAmount/@currencyID[/ubl:Invoice/cbc:TaxCurrencyCode]" flag="fatal">
        <assert test="/ubl:Invoice/cbc:TaxCurrencyCode and string(.) = string(/ubl:Invoice/cbc:TaxCurrencyCode)" flag="fatal">[SI-V12-INV-R025]-Transaction currency tax amounts MUST be in the local currency and equal to the tax currency defined on the header level</assert>
    </rule>
    <rule context="cbc:*/@currencyID" flag="fatal">
        <assert test="string(.) = string(/ubl:Invoice/cbc:DocumentCurrencyCode)" flag="fatal">[SI-V12-INV-R026]-Currency Identifier MUST be stated in the currency as defined on header level</assert>
    </rule>
    <rule context="ubl:Invoice/cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = 'VAT']/cbc:TaxAmount" flag="fatal">
        <assert test="not(/ubl:Invoice/cac:InvoiceLine/cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID != 'VAT'])" flag="fatal">[SI-V12-INV-R027]-If the VAT total amount in an invoice exists then each invoice line item MUST have a VAT category ID.</assert>
    </rule>
    <rule context="cac:AllowanceCharge" flag="fatal">
        <assert test="not(cbc:MultiplierFactorNumeric) or number(cbc:MultiplierFactorNumeric) &gt;=0" flag="fatal">[SI-V12-INV-R028]-An allowance percentage MUST NOT be negative.</assert>
        <assert test="(cbc:MultiplierFactorNumeric and cbc:BaseAmount) or (not(cbc:MultiplierFactorNumeric) and not(cbc:BaseAmount)) " flag="fatal">[SI-V12-INV-R029]-In allowances, both or none of numeric factor and base amount MUST be provided</assert>
    </rule>
</pattern>
