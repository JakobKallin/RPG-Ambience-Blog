<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="blog.xsl"/>
	
	<xsl:param name="category"/>
	<xsl:param name="slug"/>
	
	<xsl:template match="/blog">
		<xsl:apply-templates select="post[@category = $category and @slug = $slug]"/>
	</xsl:template>
	
	<xsl:template match="post">
		<xsl:call-template name="blog">
			<xsl:with-param name="head-title">
				<xsl:call-template name="heading"/>
				<xsl:text> | RPG Ambience Blog</xsl:text>
			</xsl:with-param>
			<xsl:with-param name="body-title">
				<xsl:call-template name="heading"/>
			</xsl:with-param>
			<xsl:with-param name="content">
				<p class="publication-date">
					<xsl:text>Published on </xsl:text>
					<time datetime="{@date}">
						<xsl:value-of select="format-dateTime(@date, '[MNn] [D1o], [Y]')"/>
					</time>
				</p>
				<xsl:apply-templates select="content/node()"/>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
	<xsl:template name="heading">
		<xsl:if test="@category != 'articles'">
			<span class="category">
				<xsl:choose>
					<xsl:when test="@category = 'music'">Music recommendation</xsl:when>
				</xsl:choose>
				<xsl:text>: </xsl:text>
			</span>
		</xsl:if>
		<span class="title"><xsl:apply-templates select="title/node()"/></span>
	</xsl:template>
</xsl:stylesheet>