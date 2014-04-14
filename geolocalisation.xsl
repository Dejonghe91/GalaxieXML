<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<html>
			<head>
				<title>Univ Geolocalisation</title>			
			</head>
		
			<body>
				<form methode="POST" action="relais.php" >
					<xsl:apply-templates select="//*" />
					<input type="submit" value="Send" />
				</form>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="*[not(preceding::node()[name()=name(current())])]" >
		<xsl:variable name="balise" select="name()" />
		<xsl:for-each select="@*" >
			<xsl:variable name="attribut" select="name()" />
			<xsl:variable name="nomListe" select="concat($balise,'-',$attribut)"/>
			
			<xsl:choose>
				<xsl:when test="not(name()='x') and not(name()='y') and not(name()='z')">
					<xsl:value-of select="$nomListe"/><br/>
					<select name="{$nomListe}">
						<option>Tous</option>
						<xsl:apply-templates select="//*[name()=$balise]/@*[name()=$attribut]"/>
					</select>
					<br/><br/>
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template >

	<xsl:template match="@*[not(preceding::*/@*[.=current()])]"> <!-- dépendant du contexte-->
		<option><xsl:value-of select="."/></option>
	</xsl:template> 

</xsl:stylesheet>
