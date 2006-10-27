<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output indent="no" method="text" encoding="ISO-8859-1"/>

  <!-- the root node -->
  <xsl:template match="/contributors">
    <xsl:value-of select="introduction"/>
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="name">
    <xsl:value-of select="first"/>
    <xsl:text> </xsl:text>
    <xsl:if test="middle">
      <xsl:value-of select="middle"/>
      <xsl:text> </xsl:text>
    </xsl:if>
    <xsl:value-of select="last"/>
  </xsl:template>


  <!-- dont copy the text and unmatched nodes as per default in xsl -->
  <xsl:template match="*"/>

</xsl:stylesheet>
