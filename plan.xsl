<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" />	
	<xsl:param name="criteres"/>


	<xsl:template match="/">
		<!--<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:dyn="http://exslt.org/dynamic">
			
			<xsl:variable name="xpath" >			
				<xsl:call-template name="produitXPATH">
					<xsl:with-param name="critere" select="$criteres" />
					<xsl:with-param name="oldBalise" select="bidon" />	
				</xsl:call-template>	
			</xsl:variable>
			<image xlink:href="" x="" y="" width="" height="" />
			
			<xsl:for-each select="dyn:evaluate($xpath)">
				<xsl:rect x="{@x}" y="{@y}" width="" height="" style="" />
			</xsl:for-each>
		</svg>-->
		<xsl:value-of select="$criteres" />
	</xsl:template>


	<xsl:template name="produitXPATH">
		<xsl:param name="critere" />
		<xsl:param name="oldBalise" />
		<xsl:variable name="traitement" select="substring-before($critere, '|')" />
		<xsl:variable name="reste" select="substring-after($critere, '|')" />
		<xsl:variable name="balise" select="substring-before($traitement, '-')" />
		<xsl:variable name="attribut" select="concat(substring-after($traitement, '-'),substring-before($traitement, '='))" />
		<xsl:variable name="valeur" select="substring-after($traitement, '=')" />

		<!-- Traitement creation bout xpath-->

		<xsl:if test="$reste">
			<xsl:choose>
				<xsl:when test="not($balise = $oldBalise)">
					<xsl:call-template name="produitXPATH">
						<xsl:with-param name="critere" select="$reste" />
						<xsl:with-param name="oldBalise" select="$balise" />
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="produitXPATH">
						<xsl:with-param name="critere" select="$reste" />
						<xsl:with-param name="oldBalise" select="$oldBalise" />
					</xsl:call-template>
				</xsl:otherwise>				
			</xsl:choose>
		</xsl:if>		
	</xsl:template>

</xsl:stylesheet>
