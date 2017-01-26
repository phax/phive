<!-- Schematron binding rules generated automatically. -->
<!-- Data binding to UBL syntax for T71 -->
<!-- (2009). Invinet Sistemes -->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" is-a="T71" id="UBL-T71">
  <param name="BII2-T71-R001" value="(cbc:ProfileID)"/>
  <param name="BII2-T71-R002" value="(cbc:CustomizationID)"/>
  <param name="BII2-T71-R003" value="(cbc:IssueDate)"/>
  <param name="BII2-T71-R004" value="(cbc:ID)"/>
  <param name="BII2-T71-R005" value="(cac:SenderParty)"/>
  <param name="BII2-T71-R006" value="(cac:ReceiverParty)"/>
  <param name="BII2-T71-R007" value="(cac:PartyName/cbc:Name) or (cac:PartyIdentification/cbc:ID)"/>
  <param name="BII2-T71-R008" value="(cac:PartyName/cbc:Name) or (cac:PartyIdentification/cbc:ID)"/>
  <param name="BII2-T71-R010" value="(cac:DocumentResponse/cac:DocumentReference/cbc:ID)"/>
  <param name="BII2-T71-R012" value="(cac:DocumentResponse/cac:Response/cbc:ResponseCode)"/>
  <param name="Sending_Party" value="//cac:SenderParty"/>
  <param name="Receiving_Party" value="//cac:ReceiverParty"/>
  <param name="message_level_response" value="/ubl:ApplicationResponse"/>
</pattern>
