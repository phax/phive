<!-- Schematron rules generated automatically. -->
<!-- Abstract rules for T76 -->
<!-- (2009). Invinet Sistemes -->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="T76">
  <rule context="$order_response">
    <assert test="$BII2-T76-R001" flag="fatal" id="BII2-T76-R001">[BII2-T76-R001]-A order response MUST have a customization identifier</assert>
    <assert test="$BII2-T76-R002" flag="fatal" id="BII2-T76-R002">[BII2-T76-R002]-A order response MUST have a profile identifier</assert>
  </rule>
  <rule context="$order_response_line">
    <assert test="$BII2-T76-R003" flag="fatal" id="BII2-T76-R003">[BII2-T76-R003]-Each order response line MUST have a document line identifier that is unique within the order response</assert>
  </rule>
  <rule context="$order_response">
    <assert test="$BII2-T76-R004" flag="fatal" id="BII2-T76-R004">[BII2-T76-R004]-A order response MUST have a document issue date</assert>
    <assert test="$BII2-T76-R006" flag="fatal" id="BII2-T76-R006">[BII2-T76-R006]-A order response MUST have a document identifier</assert>
  </rule>
  <rule context="$Buyer">
    <assert test="$BII2-T76-R021" flag="fatal" id="BII2-T76-R021">[BII2-T76-R021]-A order response MUST have the buyer party name or a buyer party identifier</assert>
  </rule>
  <rule context="$Seller">
    <assert test="$BII2-T76-R022" flag="fatal" id="BII2-T76-R022">[BII2-T76-R022]-A order response MUST have the seller party name or a seller party identifier</assert>
  </rule>
  <rule context="$order_response">
    <assert test="$BII2-T76-R032" flag="fatal" id="BII2-T76-R032">[BII2-T76-R032]-A order response MUST have a reference to an order</assert>
    <assert test="$BII2-T76-R033" flag="fatal" id="BII2-T76-R033">[BII2-T76-R033]-A order response MUST have a response code</assert>
  </rule>
  <rule context="$order_response_line">
    <assert test="$BII2-T76-R034" flag="fatal" id="BII2-T76-R034">[BII2-T76-R034]-An order response line MUST contain a reference to its corresponding order line.</assert>
  </rule>
</pattern>
