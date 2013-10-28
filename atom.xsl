<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="post.xsl"/>
	
	<xsl:param name="timestamp"/>
	
	<xsl:template match="/blog">
		<feed xmlns="http://www.w3.org/2005/Atom">
			<title>RPG Ambience Blog</title>
			<id>http://blog.rpg-ambience.com/</id>
			<updated><xsl:value-of select="$timestamp"/></updated>
			
			<link rel="self" href="http://blog.rpg-ambience.com/atom.xml"/>
			<link rel="related" href="http://blog.rpg-ambience.com/"/>
			
			<author>
				<name>Jakob Kallin</name>
				<email>rpg.ambience@gmail.com</email>
			</author>
			
			<icon>http://rpg-ambience.com/images/icon.png</icon>
			<subtitle>Advice on bringing your games to life with the RPG Ambience media player</subtitle>
			
			<xsl:for-each select="post">
				<xsl:sort select="@date" order="descending"/>
				<xsl:sort select="title" order="ascending"/>
				
				<xsl:variable name="url" select="string-join(('http://blog.rpg-ambience.com', @category, @slug, ''), '/')"/>
				<!-- Capture output of "heading" template in variable, because we want to strip tags later with value-of. -->
				<xsl:variable name="heading">
					<xsl:call-template name="heading"/>
				</xsl:variable>
				<entry>
					<title><xsl:value-of select="$heading"/></title>
					<id><xsl:value-of select="$url"/></id>
					<updated><xsl:value-of select="@date"/></updated>
					
					<link rel="alternate" href="{$url}"/>
					<summary><xsl:value-of select="$heading"/></summary>
				</entry>
			</xsl:for-each>
		</feed>
	</xsl:template>
</xsl:stylesheet>