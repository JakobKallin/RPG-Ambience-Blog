<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text"/>
	<xsl:template match="/blog">
		<xsl:for-each select="post">
			<xsl:value-of select="@category"/>/<xsl:value-of select="@slug"/>
			<xsl:if test="position() != last()">
				<xsl:text>&#xa;</xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>