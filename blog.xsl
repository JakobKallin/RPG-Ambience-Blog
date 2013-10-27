<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:strip-space elements="*"/>
	
	<xsl:template name="blog">
		<xsl:param name="head-title"/>
		<xsl:param name="body-title"/>
		<xsl:param name="content"/>
		<xsl:param name="stylesheets"/>
		
		<xsl:text disable-output-escaping="yes">&lt;!doctype html&gt;&#xa;</xsl:text>
		<html>
			<head>
				<meta charset="utf-8"/>
				<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
				<title><xsl:value-of select="$head-title"/></title>
				<meta name="description" content="Advice on bringing your games to life with the RPG Ambience media player."/>
				<link rel="stylesheet" href="/css/base.css"/>
				<xsl:if test="$stylesheets">
					<xsl:for-each select="$stylesheets/stylesheet">
						<link rel="stylesheet" href="/css/{@name}.css"/>
					</xsl:for-each>
				</xsl:if>
				<link rel="icon" type="image/png" href="http://rpg-ambience.com/images/icon.png"/>
			</head>
			<body>
				<header>
					<p><a href="/">RPG Ambience Blog</a></p>
					<p><a href="/">Advice on bringing your games to life with the RPG Ambience media player</a></p>
					<p><a href="http://rpg-ambience.com/">Try RPG Ambience</a></p>
				</header>
				<article>
					<h1><xsl:apply-templates select="$body-title"/></h1>
					<xsl:apply-templates select="$content"/>
				</article>
				<footer>
					<ul>
						<li><a href="/#about">About</a></li>
						<li><a href="mailto:rpg.ambience@gmail.com">Contact</a></li>
					</ul>
				</footer>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>
</xsl:stylesheet>