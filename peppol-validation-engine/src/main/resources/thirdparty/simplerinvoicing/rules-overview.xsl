<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns:axsl="http://www.w3.org/1999/XSL/Transform" xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
	<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
	
	<xsl:template match="/">
		<html>
			<head>
				<title>Rules overview</title>
			</head>
			<body>
				<table>
					<thead>
						<tr>
							<th>ID</th>
							<th>Category</th>
							<th>Description</th>
							<th>Query</th>
						</tr>
					</thead>
					<tbody>
						<xsl:apply-templates select="//svrl:failed-assert"/>
					</tbody>
				</table>			
			</body>
		</html>

	</xsl:template>
	
	<xsl:template match="svrl:failed-assert[axsl:attribute[@name='flag']/text()='fatal']">
		<tr>
			<td><xsl:value-of select="substring-before(substring-after(svrl:text, '['), ']')"/></td>
			<td><xsl:value-of select="substring-before(substring-after(svrl:text, '['), '-')"/></td>
			<td><xsl:value-of select="substring-after(svrl:text, ']-')"/></td>
			<td><xsl:choose>
				<xsl:when test="string-length(@test) > 256">Long XPath used, check the schematron source</xsl:when>
				<xsl:otherwise><xsl:value-of select="@test"/></xsl:otherwise>
			</xsl:choose></td>
		</tr>
	</xsl:template>
	
	<xsl:template match="svrl:failed-assert"></xsl:template>

</xsl:stylesheet>
