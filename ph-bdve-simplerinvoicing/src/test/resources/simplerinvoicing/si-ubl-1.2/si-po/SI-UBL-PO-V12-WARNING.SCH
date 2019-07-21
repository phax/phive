<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="SI-V12-PO-WARNING">
	<!-- Backwards compatibility statement for Simplerinvoicing v1.2, it should include the version for which the asserts in this pattern MUST not be executed -->
  <rule context="node()[not(contains(//cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biitrns001:ver2.0:extended:urn:www.peppol.eu:bis:peppol3a:ver2.0:extended:urn:www.simplerinvoicing.org:si:si-ubl:ver1.2'))] | @*[not(contains(//cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biitrns001:ver2.0:extended:urn:www.peppol.eu:bis:peppol3a:ver2.0:extended:urn:www.simplerinvoicing.org:si:si-ubl:ver1.2'))]">
    <assert test="true()" />
  </rule>
	<!-- End backwards compatibility statement -->
	
	<!-- Rules are numbered in the region 2xx -->
	<rule context="cbc:CustomizationID">
		<assert test="contains(., 'urn:www.simplerinvoicing.org:si:si-ubl:ver1.2')" flag="fatal">[SI-V12-PO-R201]-This XML instance is NOT tagged as an SI-UBL order</assert>
	</rule>
		
	<rule context="*">
		<assert test="* or normalize-space(text()) != ''" flag="warning">[SI-V12-PO-R300]-An order SHOULD not contain empty elements.</assert>
	</rule>		
</pattern>
