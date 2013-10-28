<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="blog.xsl"/>
	<xsl:import href="post.xsl"/>
	
	<xsl:template match="/blog">
		<xsl:call-template name="blog">
			<xsl:with-param name="head-title">RPG Ambience Blog</xsl:with-param>
			<xsl:with-param name="body-title">RPG Ambience Blog</xsl:with-param>
			<xsl:with-param name="stylesheets">
				<stylesheet name="front-page"/>
			</xsl:with-param>
			<xsl:with-param name="content">
				<h2>Latest posts</h2>
				<ul>
					<xsl:for-each select="post">
						<xsl:sort select="@date" order="descending"/>
						<li>
							<a href="{@category}/{@slug}/"><xsl:call-template name="heading"/></a>
							<time datetime="{@date}"><xsl:value-of select="format-dateTime(@date, '[MNn] [D1o], [Y]')"/></time>
						</li>
					</xsl:for-each>
				</ul>
				
				<h2 id="about">About</h2>
				<p>This is the official blog of the RPG Ambience media player, providing advice on bringing your games to life with music and visuals. For more information about RPG Ambience itself, and to try it out, visit <a href="http://rpg-ambience.com/">the official RPG Ambience website</a>.</p>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
</xsl:stylesheet>