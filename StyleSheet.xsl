<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:redirect="org.apache.xalan.xslt.extensions.Redirect"
	xmlns:tei="http://www.tei-c.org/ns/1.0" extension-element-prefixes="redirect" exclude-result-prefixes="redirect tei">
	<xsl:output omit-xml-declaration="yes" method="text" encoding="utf-8" indent="yes"/>
	<xsl:strip-space elements="*"/>

	<!-- variables -->
	<xsl:variable name="newline">
		<xsl:text>
				
			</xsl:text>
	</xsl:variable>

	<xsl:template match="/">
		<xsl:apply-templates select="tei:TEI/tei:text"/>
	</xsl:template>

	<xsl:template match="tei:text//*/tei:sp/text()">
		<xsl:variable name="lowerCase">
			<xsl:value-of select="translate(., 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"/>
		</xsl:variable>
		<xsl:variable name="hyphens">
			<xsl:value-of select="translate($lowerCase, '-', '&#32;')"/>
		</xsl:variable>
		<xsl:for-each select=".">
			<xsl:text>&#32;</xsl:text>
			<xsl:value-of
				select="normalize-space(translate($hyphens,
				'“”‘’,.;/[]?!&amp;&#187;&#8208;&#8209;&#8210;1234567890&#40;&#41;&#12296;&#12297;:&#34;', '&#32;'))"/>
			<xsl:text>&#32;</xsl:text>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="tei:text//*/tei:sp/tei:speaker"/>

</xsl:stylesheet>
