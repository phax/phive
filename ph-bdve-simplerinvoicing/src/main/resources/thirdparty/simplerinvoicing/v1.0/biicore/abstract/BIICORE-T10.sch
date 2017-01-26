<!-- Schematron rules generated automatically. -->
<!-- Abstract rules for T10 -->
<!-- (2009). Invinet Sistemes -->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="CORE-T10">
  <!-- Version check -->
  <rule context="node()[not(contains(//cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm010:ver1.0:#urn:www.peppol.eu:bis:peppol4a:ver1.0#urn:www.simplerinvoicing.org:si-ubl:invoice:ver1.0.x'))] | @*[not(contains(//cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm010:ver1.0:#urn:www.peppol.eu:bis:peppol4a:ver1.0#urn:www.simplerinvoicing.org:si-ubl:invoice:ver1.0.x'))]">
    <assert test="true()" />
  </rule>
  <!-- end of version check -->
  <rule context="$Invoice">
    <assert test="$BIICORE-T10-R000" flag="warning">[BIICORE-T10-R000]-This XML instance is NOT a core BiiTrdm010 transaction</assert>
    <assert test="$BIICORE-T10-R001" flag="warning">[BIICORE-T10-R001]-An invoice SHOULD not contain empty elements.</assert>
    <assert test="$BIICORE-T10-R002" flag="warning">[BIICORE-T10-R002]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R003" flag="warning">[BIICORE-T10-R003]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R004" flag="warning">[BIICORE-T10-R004]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R005" flag="warning">[BIICORE-T10-R005]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R006" flag="warning">[BIICORE-T10-R006]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R007" flag="warning">[BIICORE-T10-R007]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R008" flag="warning">[BIICORE-T10-R008]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R009" flag="warning">[BIICORE-T10-R009]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R010" flag="warning">[BIICORE-T10-R010]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R011" flag="warning">[BIICORE-T10-R011]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R012" flag="warning">[BIICORE-T10-R012]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R013" flag="warning">[BIICORE-T10-R013]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R014" flag="warning">[BIICORE-T10-R014]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R015" flag="warning">[BIICORE-T10-R015]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R016" flag="warning">[BIICORE-T10-R016]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R017" flag="warning">[BIICORE-T10-R017]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R018" flag="warning">[BIICORE-T10-R018]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R019" flag="warning">[BIICORE-T10-R019]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R020" flag="warning">[BIICORE-T10-R020]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R021" flag="warning">[BIICORE-T10-R021]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R022" flag="warning">[BIICORE-T10-R022]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R023" flag="warning">[BIICORE-T10-R023]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R024" flag="warning">[BIICORE-T10-R024]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R025" flag="warning">[BIICORE-T10-R025]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R026" flag="warning">[BIICORE-T10-R026]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R027" flag="warning">[BIICORE-T10-R027]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R028" flag="warning">[BIICORE-T10-R028]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R029" flag="warning">[BIICORE-T10-R029]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R030" flag="warning">[BIICORE-T10-R030]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R031" flag="warning">[BIICORE-T10-R031]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R032" flag="warning">[BIICORE-T10-R032]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R033" flag="warning">[BIICORE-T10-R033]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R034" flag="warning">[BIICORE-T10-R034]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R035" flag="warning">[BIICORE-T10-R035]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R036" flag="warning">[BIICORE-T10-R036]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R037" flag="warning">[BIICORE-T10-R037]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R038" flag="warning">[BIICORE-T10-R038]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R039" flag="warning">[BIICORE-T10-R039]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R040" flag="warning">[BIICORE-T10-R040]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R041" flag="warning">[BIICORE-T10-R041]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R042" flag="warning">[BIICORE-T10-R042]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R043" flag="warning">[BIICORE-T10-R043]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R044" flag="warning">[BIICORE-T10-R044]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R045" flag="warning">[BIICORE-T10-R045]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R046" flag="warning">[BIICORE-T10-R046]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R047" flag="warning">[BIICORE-T10-R047]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R048" flag="warning">[BIICORE-T10-R048]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R049" flag="warning">[BIICORE-T10-R049]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R050" flag="warning">[BIICORE-T10-R050]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R051" flag="warning">[BIICORE-T10-R051]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R052" flag="warning">[BIICORE-T10-R052]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R053" flag="warning">[BIICORE-T10-R053]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R054" flag="warning">[BIICORE-T10-R054]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R055" flag="warning">[BIICORE-T10-R055]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R056" flag="warning">[BIICORE-T10-R056]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R057" flag="warning">[BIICORE-T10-R057]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R058" flag="warning">[BIICORE-T10-R058]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R059" flag="warning">[BIICORE-T10-R059]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R060" flag="warning">[BIICORE-T10-R060]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R061" flag="warning">[BIICORE-T10-R061]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R062" flag="warning">[BIICORE-T10-R062]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R063" flag="warning">[BIICORE-T10-R063]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R064" flag="warning">[BIICORE-T10-R064]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R065" flag="warning">[BIICORE-T10-R065]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R066" flag="warning">[BIICORE-T10-R066]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R067" flag="warning">[BIICORE-T10-R067]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R068" flag="warning">[BIICORE-T10-R068]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R069" flag="warning">[BIICORE-T10-R069]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R070" flag="warning">[BIICORE-T10-R070]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R071" flag="warning">[BIICORE-T10-R071]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R072" flag="warning">[BIICORE-T10-R072]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R073" flag="warning">[BIICORE-T10-R073]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R074" flag="warning">[BIICORE-T10-R074]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R075" flag="warning">[BIICORE-T10-R075]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R076" flag="warning">[BIICORE-T10-R076]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R077" flag="warning">[BIICORE-T10-R077]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R078" flag="warning">[BIICORE-T10-R078]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R079" flag="warning">[BIICORE-T10-R079]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R080" flag="warning">[BIICORE-T10-R080]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R081" flag="warning">[BIICORE-T10-R081]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R082" flag="warning">[BIICORE-T10-R082]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R083" flag="warning">[BIICORE-T10-R083]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R084" flag="warning">[BIICORE-T10-R084]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R085" flag="warning">[BIICORE-T10-R085]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R086" flag="warning">[BIICORE-T10-R086]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R087" flag="warning">[BIICORE-T10-R087]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R088" flag="warning">[BIICORE-T10-R088]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R089" flag="warning">[BIICORE-T10-R089]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R090" flag="warning">[BIICORE-T10-R090]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R091" flag="warning">[BIICORE-T10-R091]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R092" flag="warning">[BIICORE-T10-R092]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R093" flag="warning">[BIICORE-T10-R093]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R094" flag="warning">[BIICORE-T10-R094]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R095" flag="warning">[BIICORE-T10-R095]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R096" flag="warning">[BIICORE-T10-R096]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R097" flag="warning">[BIICORE-T10-R097]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R098" flag="warning">[BIICORE-T10-R098]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R099" flag="warning">[BIICORE-T10-R099]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R100" flag="warning">[BIICORE-T10-R100]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R101" flag="warning">[BIICORE-T10-R101]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R102" flag="warning">[BIICORE-T10-R102]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R103" flag="warning">[BIICORE-T10-R103]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R104" flag="warning">[BIICORE-T10-R104]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R105" flag="warning">[BIICORE-T10-R105]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R106" flag="warning">[BIICORE-T10-R106]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R107" flag="warning">[BIICORE-T10-R107]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R108" flag="warning">[BIICORE-T10-R108]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R109" flag="warning">[BIICORE-T10-R109]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R110" flag="warning">[BIICORE-T10-R110]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R111" flag="warning">[BIICORE-T10-R111]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R112" flag="warning">[BIICORE-T10-R112]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R113" flag="warning">[BIICORE-T10-R113]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R114" flag="warning">[BIICORE-T10-R114]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R115" flag="warning">[BIICORE-T10-R115]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R116" flag="warning">[BIICORE-T10-R116]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R117" flag="warning">[BIICORE-T10-R117]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R118" flag="warning">[BIICORE-T10-R118]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R119" flag="warning">[BIICORE-T10-R119]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R120" flag="warning">[BIICORE-T10-R120]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R121" flag="warning">[BIICORE-T10-R121]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R122" flag="warning">[BIICORE-T10-R122]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R123" flag="warning">[BIICORE-T10-R123]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R124" flag="warning">[BIICORE-T10-R124]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R125" flag="warning">[BIICORE-T10-R125]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R126" flag="warning">[BIICORE-T10-R126]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R127" flag="warning">[BIICORE-T10-R127]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R128" flag="warning">[BIICORE-T10-R128]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R129" flag="warning">[BIICORE-T10-R129]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R130" flag="warning">[BIICORE-T10-R130]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R131" flag="warning">[BIICORE-T10-R131]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R132" flag="warning">[BIICORE-T10-R132]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R133" flag="warning">[BIICORE-T10-R133]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R134" flag="warning">[BIICORE-T10-R134]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R135" flag="warning">[BIICORE-T10-R135]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R136" flag="warning">[BIICORE-T10-R136]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R137" flag="warning">[BIICORE-T10-R137]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R138" flag="warning">[BIICORE-T10-R138]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R139" flag="warning">[BIICORE-T10-R139]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R140" flag="warning">[BIICORE-T10-R140]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R141" flag="warning">[BIICORE-T10-R141]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R142" flag="warning">[BIICORE-T10-R142]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R143" flag="warning">[BIICORE-T10-R143]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R144" flag="warning">[BIICORE-T10-R144]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R145" flag="warning">[BIICORE-T10-R145]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R146" flag="warning">[BIICORE-T10-R146]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R147" flag="warning">[BIICORE-T10-R147]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R148" flag="warning">[BIICORE-T10-R148]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R149" flag="warning">[BIICORE-T10-R149]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R150" flag="warning">[BIICORE-T10-R150]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R151" flag="warning">[BIICORE-T10-R151]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R152" flag="warning">[BIICORE-T10-R152]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R153" flag="warning">[BIICORE-T10-R153]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R154" flag="warning">[BIICORE-T10-R154]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R155" flag="warning">[BIICORE-T10-R155]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R156" flag="warning">[BIICORE-T10-R156]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R157" flag="warning">[BIICORE-T10-R157]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R158" flag="warning">[BIICORE-T10-R158]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R159" flag="warning">[BIICORE-T10-R159]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R160" flag="warning">[BIICORE-T10-R160]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R161" flag="warning">[BIICORE-T10-R161]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R162" flag="warning">[BIICORE-T10-R162]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R163" flag="warning">[BIICORE-T10-R163]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R164" flag="warning">[BIICORE-T10-R164]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R165" flag="warning">[BIICORE-T10-R165]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R166" flag="warning">[BIICORE-T10-R166]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R167" flag="warning">[BIICORE-T10-R167]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R168" flag="warning">[BIICORE-T10-R168]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R169" flag="warning">[BIICORE-T10-R169]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R170" flag="warning">[BIICORE-T10-R170]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R171" flag="warning">[BIICORE-T10-R171]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R172" flag="warning">[BIICORE-T10-R172]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R173" flag="warning">[BIICORE-T10-R173]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R174" flag="warning">[BIICORE-T10-R174]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R175" flag="warning">[BIICORE-T10-R175]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R176" flag="warning">[BIICORE-T10-R176]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R177" flag="warning">[BIICORE-T10-R177]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R178" flag="warning">[BIICORE-T10-R178]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R179" flag="warning">[BIICORE-T10-R179]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R180" flag="warning">[BIICORE-T10-R180]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R181" flag="warning">[BIICORE-T10-R181]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R182" flag="warning">[BIICORE-T10-R182]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R183" flag="warning">[BIICORE-T10-R183]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R184" flag="warning">[BIICORE-T10-R184]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R185" flag="warning">[BIICORE-T10-R185]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R186" flag="warning">[BIICORE-T10-R186]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R187" flag="warning">[BIICORE-T10-R187]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R188" flag="warning">[BIICORE-T10-R188]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R189" flag="warning">[BIICORE-T10-R189]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R190" flag="warning">[BIICORE-T10-R190]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R191" flag="warning">[BIICORE-T10-R191]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R192" flag="warning">[BIICORE-T10-R192]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R193" flag="warning">[BIICORE-T10-R193]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R194" flag="warning">[BIICORE-T10-R194]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R195" flag="warning">[BIICORE-T10-R195]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R196" flag="warning">[BIICORE-T10-R196]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R197" flag="warning">[BIICORE-T10-R197]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R198" flag="warning">[BIICORE-T10-R198]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R199" flag="warning">[BIICORE-T10-R199]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R200" flag="warning">[BIICORE-T10-R200]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R201" flag="warning">[BIICORE-T10-R201]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R202" flag="warning">[BIICORE-T10-R202]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R203" flag="warning">[BIICORE-T10-R203]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R204" flag="warning">[BIICORE-T10-R204]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R205" flag="warning">[BIICORE-T10-R205]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R206" flag="warning">[BIICORE-T10-R206]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R207" flag="warning">[BIICORE-T10-R207]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R208" flag="warning">[BIICORE-T10-R208]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R209" flag="warning">[BIICORE-T10-R209]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R210" flag="warning">[BIICORE-T10-R210]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R211" flag="warning">[BIICORE-T10-R211]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R212" flag="warning">[BIICORE-T10-R212]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R213" flag="warning">[BIICORE-T10-R213]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R214" flag="warning">[BIICORE-T10-R214]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R215" flag="warning">[BIICORE-T10-R215]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R216" flag="warning">[BIICORE-T10-R216]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R217" flag="warning">[BIICORE-T10-R217]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R218" flag="warning">[BIICORE-T10-R218]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R219" flag="warning">[BIICORE-T10-R219]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R220" flag="warning">[BIICORE-T10-R220]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R221" flag="warning">[BIICORE-T10-R221]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R222" flag="warning">[BIICORE-T10-R222]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R223" flag="warning">[BIICORE-T10-R223]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R224" flag="warning">[BIICORE-T10-R224]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R225" flag="warning">[BIICORE-T10-R225]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R226" flag="warning">[BIICORE-T10-R226]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R227" flag="warning">[BIICORE-T10-R227]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R228" flag="warning">[BIICORE-T10-R228]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R229" flag="warning">[BIICORE-T10-R229]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R230" flag="warning">[BIICORE-T10-R230]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R231" flag="warning">[BIICORE-T10-R231]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R232" flag="warning">[BIICORE-T10-R232]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R233" flag="warning">[BIICORE-T10-R233]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R234" flag="warning">[BIICORE-T10-R234]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R235" flag="warning">[BIICORE-T10-R235]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R236" flag="warning">[BIICORE-T10-R236]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R237" flag="warning">[BIICORE-T10-R237]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R238" flag="warning">[BIICORE-T10-R238]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R239" flag="warning">[BIICORE-T10-R239]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R240" flag="warning">[BIICORE-T10-R240]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R241" flag="warning">[BIICORE-T10-R241]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R242" flag="warning">[BIICORE-T10-R242]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R243" flag="warning">[BIICORE-T10-R243]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R244" flag="warning">[BIICORE-T10-R244]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R245" flag="warning">[BIICORE-T10-R245]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R246" flag="warning">[BIICORE-T10-R246]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R247" flag="warning">[BIICORE-T10-R247]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R248" flag="warning">[BIICORE-T10-R248]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R249" flag="warning">[BIICORE-T10-R249]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R250" flag="warning">[BIICORE-T10-R250]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R251" flag="warning">[BIICORE-T10-R251]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R252" flag="warning">[BIICORE-T10-R252]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R253" flag="warning">[BIICORE-T10-R253]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R254" flag="warning">[BIICORE-T10-R254]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R255" flag="warning">[BIICORE-T10-R255]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R256" flag="warning">[BIICORE-T10-R256]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R257" flag="warning">[BIICORE-T10-R257]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R258" flag="warning">[BIICORE-T10-R258]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R259" flag="warning">[BIICORE-T10-R259]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R260" flag="warning">[BIICORE-T10-R260]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R261" flag="warning">[BIICORE-T10-R261]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R262" flag="warning">[BIICORE-T10-R262]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R263" flag="warning">[BIICORE-T10-R263]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R264" flag="warning">[BIICORE-T10-R264]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R265" flag="warning">[BIICORE-T10-R265]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R266" flag="warning">[BIICORE-T10-R266]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R267" flag="warning">[BIICORE-T10-R267]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R268" flag="warning">[BIICORE-T10-R268]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R269" flag="warning">[BIICORE-T10-R269]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R270" flag="warning">[BIICORE-T10-R270]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R271" flag="warning">[BIICORE-T10-R271]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R272" flag="warning">[BIICORE-T10-R272]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R273" flag="warning">[BIICORE-T10-R273]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R274" flag="warning">[BIICORE-T10-R274]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R275" flag="warning">[BIICORE-T10-R275]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R276" flag="warning">[BIICORE-T10-R276]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R277" flag="warning">[BIICORE-T10-R277]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R278" flag="warning">[BIICORE-T10-R278]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R279" flag="warning">[BIICORE-T10-R279]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R280" flag="warning">[BIICORE-T10-R280]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R281" flag="warning">[BIICORE-T10-R281]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R282" flag="warning">[BIICORE-T10-R282]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R283" flag="warning">[BIICORE-T10-R283]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R284" flag="warning">[BIICORE-T10-R284]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R285" flag="warning">[BIICORE-T10-R285]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R286" flag="warning">[BIICORE-T10-R286]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R287" flag="warning">[BIICORE-T10-R287]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R288" flag="warning">[BIICORE-T10-R288]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R289" flag="warning">[BIICORE-T10-R289]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R290" flag="warning">[BIICORE-T10-R290]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R291" flag="warning">[BIICORE-T10-R291]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R292" flag="warning">[BIICORE-T10-R292]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R293" flag="warning">[BIICORE-T10-R293]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R294" flag="warning">[BIICORE-T10-R294]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R295" flag="warning">[BIICORE-T10-R295]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R296" flag="warning">[BIICORE-T10-R296]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R297" flag="warning">[BIICORE-T10-R297]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R298" flag="warning">[BIICORE-T10-R298]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R299" flag="warning">[BIICORE-T10-R299]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R300" flag="warning">[BIICORE-T10-R300]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R301" flag="warning">[BIICORE-T10-R301]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R302" flag="warning">[BIICORE-T10-R302]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R303" flag="warning">[BIICORE-T10-R303]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R304" flag="warning">[BIICORE-T10-R304]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R305" flag="warning">[BIICORE-T10-R305]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R306" flag="warning">[BIICORE-T10-R306]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R307" flag="warning">[BIICORE-T10-R307]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R308" flag="warning">[BIICORE-T10-R308]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R309" flag="warning">[BIICORE-T10-R309]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R310" flag="warning">[BIICORE-T10-R310]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R311" flag="warning">[BIICORE-T10-R311]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R312" flag="warning">[BIICORE-T10-R312]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R313" flag="warning">[BIICORE-T10-R313]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R314" flag="warning">[BIICORE-T10-R314]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R315" flag="warning">[BIICORE-T10-R315]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R316" flag="warning">[BIICORE-T10-R316]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R317" flag="warning">[BIICORE-T10-R317]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R318" flag="warning">[BIICORE-T10-R318]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R319" flag="warning">[BIICORE-T10-R319]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R320" flag="warning">[BIICORE-T10-R320]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R321" flag="warning">[BIICORE-T10-R321]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R322" flag="warning">[BIICORE-T10-R322]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R323" flag="warning">[BIICORE-T10-R323]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R324" flag="warning">[BIICORE-T10-R324]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R325" flag="warning">[BIICORE-T10-R325]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R326" flag="warning">[BIICORE-T10-R326]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R327" flag="warning">[BIICORE-T10-R327]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R328" flag="warning">[BIICORE-T10-R328]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R329" flag="warning">[BIICORE-T10-R329]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R330" flag="warning">[BIICORE-T10-R330]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R331" flag="warning">[BIICORE-T10-R331]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R332" flag="warning">[BIICORE-T10-R332]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R333" flag="warning">[BIICORE-T10-R333]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R334" flag="warning">[BIICORE-T10-R334]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R335" flag="warning">[BIICORE-T10-R335]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R336" flag="warning">[BIICORE-T10-R336]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R337" flag="warning">[BIICORE-T10-R337]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R338" flag="warning">[BIICORE-T10-R338]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R339" flag="warning">[BIICORE-T10-R339]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R340" flag="warning">[BIICORE-T10-R340]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R341" flag="warning">[BIICORE-T10-R341]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R342" flag="warning">[BIICORE-T10-R342]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R343" flag="warning">[BIICORE-T10-R343]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R344" flag="warning">[BIICORE-T10-R344]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R345" flag="warning">[BIICORE-T10-R345]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R346" flag="warning">[BIICORE-T10-R346]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R347" flag="warning">[BIICORE-T10-R347]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R348" flag="warning">[BIICORE-T10-R348]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R349" flag="warning">[BIICORE-T10-R349]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R350" flag="warning">[BIICORE-T10-R350]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R351" flag="warning">[BIICORE-T10-R351]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R352" flag="warning">[BIICORE-T10-R352]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R353" flag="warning">[BIICORE-T10-R353]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R354" flag="warning">[BIICORE-T10-R354]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R355" flag="warning">[BIICORE-T10-R355]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R356" flag="warning">[BIICORE-T10-R356]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R357" flag="warning">[BIICORE-T10-R357]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R358" flag="warning">[BIICORE-T10-R358]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R359" flag="warning">[BIICORE-T10-R359]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R360" flag="warning">[BIICORE-T10-R360]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R361" flag="warning">[BIICORE-T10-R361]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R362" flag="warning">[BIICORE-T10-R362]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R363" flag="warning">[BIICORE-T10-R363]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R364" flag="warning">[BIICORE-T10-R364]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R365" flag="warning">[BIICORE-T10-R365]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R366" flag="warning">[BIICORE-T10-R366]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R367" flag="warning">[BIICORE-T10-R367]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R368" flag="warning">[BIICORE-T10-R368]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R369" flag="warning">[BIICORE-T10-R369]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R370" flag="warning">[BIICORE-T10-R370]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R371" flag="warning">[BIICORE-T10-R371]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R372" flag="warning">[BIICORE-T10-R372]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R373" flag="warning">[BIICORE-T10-R373]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R374" flag="warning">[BIICORE-T10-R374]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R375" flag="warning">[BIICORE-T10-R375]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R376" flag="warning">[BIICORE-T10-R376]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R377" flag="warning">[BIICORE-T10-R377]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R378" flag="warning">[BIICORE-T10-R378]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R379" flag="warning">[BIICORE-T10-R379]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R380" flag="warning">[BIICORE-T10-R380]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R381" flag="warning">[BIICORE-T10-R381]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R382" flag="warning">[BIICORE-T10-R382]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R383" flag="warning">[BIICORE-T10-R383]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R384" flag="warning">[BIICORE-T10-R384]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R385" flag="warning">[BIICORE-T10-R385]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
    <assert test="$BIICORE-T10-R386" flag="warning">[BIICORE-T10-R386]-A conformant CEN BII invoice core data model SHOULD not have data elements not in the core.</assert>
  </rule>
  <rule context="$Customer">
    <assert test="$BIICORE-T10-R387" flag="warning">[BIICORE-T10-R387]-Element 'PartyIdentification' may occur at maximum 1 times.</assert>
    <assert test="$BIICORE-T10-R388" flag="warning">[BIICORE-T10-R388]-Element 'PartyName' must occur exactly 1 times.</assert>
    <assert test="$BIICORE-T10-R389" flag="warning">[BIICORE-T10-R389]-Element 'PartyTaxScheme' may occur at maximum 1 times.</assert>
  </rule>
  <rule context="$Supplier">
    <assert test="$BIICORE-T10-R390" flag="warning">[BIICORE-T10-R390]-Element 'PartyIdentification' may occur at maximum 1 times.</assert>
    <assert test="$BIICORE-T10-R391" flag="warning">[BIICORE-T10-R391]-Element 'PartyName' must occur exactly 1 times.</assert>
    <assert test="$BIICORE-T10-R392" flag="warning">[BIICORE-T10-R392]-Element 'PostalAddress' must occur exactly 1 times.</assert>
    <assert test="$BIICORE-T10-R393" flag="warning">[BIICORE-T10-R393]-Element 'PartyTaxScheme' may occur at maximum 1 times.</assert>
  </rule>
  <rule context="$InvoiceLine">
    <assert test="$BIICORE-T10-R394" flag="warning">[BIICORE-T10-R394]-Element 'TaxTotal' may occur at maximum 1 times.</assert>
    <assert test="$BIICORE-T10-R395" flag="warning">[BIICORE-T10-R395]-Element 'Price' must occur exactly 1 times.</assert>
  </rule>
  <rule context="$Item">
    <assert test="$BIICORE-T10-R396" flag="warning">[BIICORE-T10-R396]-Element 'Description' may occur at maximum 1 times.</assert>
    <assert test="$BIICORE-T10-R397" flag="warning">[BIICORE-T10-R397]-Element 'Name' must occur exactly 1 times.</assert>
    <assert test="$BIICORE-T10-R398" flag="warning">[BIICORE-T10-R398]-Element 'ClassifiedTaxCategory' may occur at maximum 1 times.</assert>
  </rule>
  <rule context="$Price">
    <assert test="$BIICORE-T10-R399" flag="warning">[BIICORE-T10-R399]-Element 'AllowanceCharge' may occur at maximum 1 times.</assert>
  </rule>
  <rule context="$Monetary_Total">
    <assert test="$BIICORE-T10-R400" flag="warning">[BIICORE-T10-R400]-Element 'TaxExclusiveAmount' must occur exactly 1 times.</assert>
    <assert test="$BIICORE-T10-R401" flag="warning">[BIICORE-T10-R401]-Element 'TaxInclusiveAmount' must occur exactly 1 times.</assert>
  </rule>
  <rule context="$Payee">
    <assert test="$BIICORE-T10-R402" flag="warning">[BIICORE-T10-R402]-Element 'PartyIdentification' may occur at maximum 1 times.</assert>
    <assert test="$BIICORE-T10-R403" flag="warning">[BIICORE-T10-R403]-Element 'PartyName' may occur at maximum 1 times</assert>
  </rule>
  <rule context="$Financial_Account">
    <assert test="$BIICORE-T10-R404" flag="warning">[BIICORE-T10-R404]-Element 'ID' must occur exactly 1 times.</assert>
  </rule>
</pattern>
