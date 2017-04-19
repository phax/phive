<pattern xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="T77">
	<rule context="$Catalogue">
		<assert test="$BII3-T77-R005" flag="fatal" id="BII3-T77-R005">[BII3-T77-R005]-A catalogue MUST have a shopping cart identifier</assert>
		<assert test="$BII3-T77-R003" flag="fatal" id="BII3-T77-R003">[BII3-T77-R003]-A catalogue MUST have an issue date</assert>
		<assert test="$BII3-T77-R004" flag="fatal" id="BII3-T77-R004">[BII3-T77-R004]-A catalogue MUST contain the time of issue</assert>
		<assert test="$BII3-T77-R016" flag="fatal" id="BII3-T77-R016">[BII3-T77-R016]-A catalogue MUST contain the shopping cart currency</assert>
		<assert test="$BII3-T77-R002" flag="fatal" id="BII3-T77-R002">[BII3-T77-R002]-A catalogue MUST contain profile identifier</assert>
		<assert test="$BII3-T77-R001" flag="fatal" id="BII3-T77-R001">[BII3-T77-R001]-A catalogue MUST contain customization identifier</assert>
		<assert test="$BII3-T77-R017" flag="fatal" id="BII3-T77-R017">[BII3-T77-R017]-A validity period MUST contain the "shopping cart validity period end date" at most once</assert>
	</rule>
	<rule context="$Catalogue_Provider">
		<assert test="$BII3-T77-R018" flag="fatal" id="BII3-T77-R018">[BII3-T77-R018]-A seller MUST contain the full name and it should be at most once</assert>
		<assert test="$BII3-T77-R019" flag="fatal" id="BII3-T77-R019">[BII3-T77-R019]-A seller id MUST be at most one</assert>
	</rule>
	<rule context="$Catalogue_Receiver">
		<assert test="$BII3-T77-R020" flag="fatal" id="BII3-T77-R020">[BII3-T77-R020]-A buyer MUST contain the full name and it should be at most once</assert>
	</rule>
	<rule context="$Catalogue_Line">
		<assert test="$BII3-T77-R009" flag="fatal" id="BII3-T77-R009">[BII3-T77-R009]-A catalogue line MUST contain a unique line identifier</assert>
		<assert test="$BII3-T77-R021" flag="fatal" id="BII3-T77-R021">[BII3-T77-R021]-A catalogue line MUST contain a shopping cart line quantity and it should be at most one</assert>
		<assert test="$BII3-T77-R010" flag="fatal" id="BII3-T77-R010">[BII3-T77-R010]-Shopping cart line quantities MUST be greater than ZERO.</assert>
		<assert test="$BII3-T77-R022" flag="fatal" id="BII3-T77-R022">[BII3-T77-R022]-A catalogue line MUST contain configured product identifier at most once</assert>
	</rule>
	<rule context="$Item">
		<assert test="$BII3-T77-R013" flag="fatal" id="BII3-T77-R013">[BII3-T77-R013]-An item in a catalogue line SHOULD have a name</assert>
		<assert test="$BII3-T77-R012" flag="fatal" id="BII3-T77-R012">[BII3-T77-R012]-An item in a shopping cart MUST be uniquely identifiable by either "item sellers identifier" or "item standard identifier"</assert>
		<assert test="$BII3-T77-R023" flag="fatal" id="BII3-T77-R023">[BII3-T77-R023]-An item in a catalogue line SHOULD have at most one description</assert>
		<assert test="$BII3-T77-R024" flag="fatal" id="BII3-T77-R024">[BII3-T77-R024]-An item in a catalogue line SHOULD have at most one manufacturers item identification</assert>
		<assert test="$BII3-T77-R025" flag="fatal" id="BII3-T77-R025">[BII3-T77-R025]-An item in a catalogue line SHOULD have at most one attachment</assert>
		<assert test="$BII3-T77-R026" flag="fatal" id="BII3-T77-R026">[BII3-T77-R026]-An item in a catalogue line SHOULD have at most one attachment document description</assert>
		<assert test="$BII3-T77-R027" flag="fatal" id="BII3-T77-R027">[BII3-T77-R027]-An item in a catalogue line SHOULD have at most one manufacturer party name</assert>
		<assert test="$BII3-T77-R015" flag="fatal" id="BII3-T77-R015">[BII3-T77-R015]-An item in a catalogue line SHOULD have one and at most one line VAT information</assert>
		<assert test="$BII3-T77-R028" flag="fatal" id="BII3-T77-R028">[BII3-T77-R028]-An item in a catalogue line SHOULD have one and at most one line item VAT category code</assert>
		<assert test="$BII3-T77-R029" flag="fatal" id="BII3-T77-R029">[BII3-T77-R029]-An item in a catalogue line SHOULD have one and at most one line item VAT rate</assert>
		<assert test="$BII3-T77-R030" flag="fatal" id="BII3-T77-R030">[BII3-T77-R030]-An item in a catalogue line SHOULD have at most one commodity classification</assert>
	</rule>
	<rule context="$Item_Commodity">
		<assert test="$BII3-T77-R031" flag="warning" id="BII3-T77-R031">[BII3-T77-R031]-Classification codes SHOULD contain the Classification scheme Identifier (e.g. CPV or UNSPSC)</assert>
	</rule>
	<rule context="$Item_Price">
		<assert test="$BII3-T77-R011" flag="fatal" id="BII3-T77-R011">[BII3-T77-R011]-Prices of items MUST not be negative</assert>
	</rule>
</pattern>
