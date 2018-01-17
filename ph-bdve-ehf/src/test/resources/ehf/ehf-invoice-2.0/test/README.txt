The test folder is used to place testable xml files for different Norwegian trade formats. 

How to name new test files:

1. Placement
Place the new file under the correct sub folder.

2. File name
Give the new file a name that corresponds to the errors it contains, e.g. BIICORE-T10-R115.xml.

3. Description
Add a text to each test file that describes the scenario the test file contains.

Add the following to your XML file (must be placed after the xml declaration - <?xml version="1.0" encoding="UTF-8"?>):

<?xml version="1.0" encoding="UTF-8"?>
<!--
	Content:
	This file contains a norwegian invoice

	Errors:
	BIICORE-T10-R115

	Warnings:
	BIICORE-T10-R114
-->
<Invoice xmlns="urn:oasis:names:specification.........




