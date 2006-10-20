<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

  <xsl:output method="text" indent="no"/>

  <xsl:template match="release">
    <xsl:text>Changes in </xsl:text>
    <xsl:value-of select="@version"/>
    <xsl:text>
</xsl:text>
    <xsl:text>==============================================

</xsl:text>
    <xsl:text>Changes that Could Break Older Environments:
--------------------------------------------

</xsl:text>

    <xsl:apply-templates select="./action[@breaks-bwc='true']" mode="li"/>

    <xsl:text>Fixed Bugs:
-----------

</xsl:text>

    <xsl:apply-templates select="./action[@type='fix' and not(@breaks-bwc='true')]" mode="li"/>

    <xsl:text>Other Changes:
--------------

</xsl:text>

    <xsl:apply-templates select="./action[not(@type='fix') and not(@breaks-bwc='true')]" mode="li"/>
    <xsl:text>
</xsl:text>
  </xsl:template>

  <xsl:template match="action" mode="li">
    <xsl:value-of select="text()"/>
    <xsl:if test="not(@issue='')">
      <xsl:text>
        BugZilla Issue </xsl:text><xsl:value-of select="@issue"/><xsl:text>

</xsl:text>
    </xsl:if>
  </xsl:template>

  <!-- dont copy the text and unmatched nodes as per default in xsl -->
  <xsl:template match="text()"/>

</xsl:stylesheet>
